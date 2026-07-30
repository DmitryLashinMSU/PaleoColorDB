from app.extensions import db

# Вспомогательная таблица для публикаций
taxon_publication = db.Table('taxon_publication',
    db.Column('taxon_id', db.Integer, db.ForeignKey('taxon.id'), primary_key=True),
    db.Column('publication_id', db.Integer, db.ForeignKey('publication.id'), primary_key=True)
)

# Вспомогательная таблица для связи видов и медиафайлов
taxon_media = db.Table('taxon_media',
    db.Column('taxon_id', db.Integer, db.ForeignKey('taxon.id'), primary_key=True),
    db.Column('media_id', db.Integer, db.ForeignKey('media.id'), primary_key=True)
)

class Taxon(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(150), nullable=False, unique=True)
    geologic_time = db.Column(db.String(150))
    location = db.Column(db.String(200))
    fossil_site = db.Column(db.String(250))
    coloration_data = db.Column(db.Text)
    method_used = db.Column(db.String(250))
    
    publications = db.relationship('Publication', secondary=taxon_publication, lazy='subquery',
                                   backref=db.backref('taxa', lazy=True))
    
    media_files = db.relationship('Media', secondary=taxon_media, lazy='subquery', 
                                  backref=db.backref('taxa', lazy=True))

    def __str__(self):
        return self.name

class Publication(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(500), nullable=False)
    year = db.Column(db.Integer)
    authors = db.Column(db.Text)
    abstract = db.Column(db.Text)
    description = db.Column(db.Text)
    doi = db.Column(db.String(150))

    def __str__(self):
        return f"{self.authors} ({self.year})"

class Media(db.Model):
    id = db.Column(db.Integer, primary_key=True)    
    file_path = db.Column(db.String(500), nullable=False) 
    media_type = db.Column(db.String(50)) 
    description = db.Column(db.String(250))

    def __str__(self):
        return self.file_path