from flask import Flask, redirect
from .config import Config
from .extensions import db, migrate, admin_panel
from flask_admin.contrib.sqla import ModelView
from flask_admin import AdminIndexView, expose
from flask_admin.menu import MenuLink

from app.models import Taxon, Publication, Media

def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)

    db.init_app(app)
    migrate.init_app(app, db)

    class DashboardView(AdminIndexView):
        def is_visible(self):
            return False

        @expose('/')
        def index(self):
            return redirect('/admin/taxon/')

    class TaxonAdmin(ModelView):
        column_searchable_list = ['name', 'geologic_time', 'location']
        column_filters = ['name', 'geologic_time', 'location', 'fossil_site', 'method_used']
        form_columns = ['name', 'geologic_time', 'location', 'fossil_site', 'coloration_data', 'method_used', 'publications']

    class PublicationAdmin(ModelView):
        column_list = ['title', 'year', 'authors', 'description', 'doi', 'taxa']
        column_searchable_list = ['title', 'year', 'authors', 'description', 'taxa.name']
        column_filters = ['title', 'year', 'authors', 'description', 'doi', 'taxa.name']

    class MediaAdmin(ModelView):
        column_list = ['file_path', 'media_type', 'description', 'taxa']
        column_searchable_list = ['file_path', 'media_type', 'description']
        column_sortable_list = ['file_path', 'media_type', 'description']
        column_filters = ['media_type', 'file_path', 'description', 'taxa.name']
        
        form_choices = {
            'media_type': [
                ('reconstruction', 'reconstruction'),
                ('fossil_photo', 'fossil_photo'),
                ('size_comparison', 'size_comparison'),
                ('pdf_article', 'pdf_article')
            ]
        }

        def get_filters(self):
            filters = super().get_filters()
            if filters:
                for f in filters:
                    if f.name == 'taxa / Taxon / Name':
                        f.name = 'Taxon'
            return filters

    admin_panel.name = "PaleoColor DB"
    
    admin_panel.init_app(app, index_view=DashboardView(url='/admin'))

    admin_panel.add_link(MenuLink(name='На главную', url='/'))
    admin_panel.add_view(TaxonAdmin(Taxon, db.session, name="Животные"))
    admin_panel.add_view(PublicationAdmin(Publication, db.session, name="Публикации"))
    admin_panel.add_view(MediaAdmin(Media, db.session, name="Медиа и файлы"))

    from app.main import bp as main_bp
    app.register_blueprint(main_bp)

    return app