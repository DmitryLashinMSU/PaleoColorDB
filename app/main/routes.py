from flask import render_template
from sqlalchemy import case
from app.main import bp
from app.models import Taxon, Publication
from app.forms import SearchForm

@bp.route('/', methods=['GET', 'POST'])
def index():
    form = SearchForm()
    query = Taxon.query

    if form.validate_on_submit():
        if form.name.data:
            query = query.filter(Taxon.name.ilike(f"%{form.name.data}%"))
        if form.geologic_time.data:
            query = query.filter(Taxon.geologic_time.ilike(f"%{form.geologic_time.data}%"))
        if form.country.data:
            query = query.filter(Taxon.location.ilike(f"%{form.country.data}%"))
            
        # Умная хронологическая сортировка
        if form.sort_by.data == 'period':
            period_order = case(
                (Taxon.geologic_time.ilike('%кембр%'), 1),
                (Taxon.geologic_time.ilike('%ордов%'), 2),
                (Taxon.geologic_time.ilike('%силур%'), 3),
                (Taxon.geologic_time.ilike('%девон%'), 4),
                (Taxon.geologic_time.ilike('%карбон%'), 5),
                (Taxon.geologic_time.ilike('%перм%'), 6),
                (Taxon.geologic_time.ilike('%триас%'), 7),
                (Taxon.geologic_time.ilike('%юр%'), 8),
                (Taxon.geologic_time.ilike('%мел%'), 9),
                else_=10
            )
            # Сначала сортируем по хронологии, затем внутри периода по алфавиту
            query = query.order_by(period_order, Taxon.name)
        else:
            query = query.order_by(Taxon.name)
    else:
        query = query.order_by(Taxon.name)

    taxa = query.all()
    return render_template('main/index.html', form=form, taxa=taxa)

@bp.route('/taxon/<int:id>')
def taxon_detail(id):
    taxon = Taxon.query.get_or_404(id)
    # Сортировка файлов для отображения
    fossils = [m for m in taxon.media_files if m.media_type == 'fossil_photo']
    reconstructions = [m for m in taxon.media_files if m.media_type == 'reconstruction']
    sizes = [m for m in taxon.media_files if m.media_type == 'size_comparison']
    pdfs = [m for m in taxon.media_files if m.media_type == 'pdf_article']
    
    return render_template('taxon/detail.html', taxon=taxon, fossils=fossils, 
                           reconstructions=reconstructions, sizes=sizes, pdfs=pdfs)

@bp.route('/publication/<int:id>')
def publication_detail(id):
    pub = Publication.query.get_or_404(id)
    return render_template('publication/detail.html', publication=pub)