from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, SelectField
from wtforms.validators import Optional

class SearchForm(FlaskForm):
    name = StringField('Название', validators=[Optional()])
    geologic_time = StringField('Период', validators=[Optional()])
    country = StringField('Страна', validators=[Optional()])
    sort_by = SelectField('Сортировка', choices=[
        ('name', 'По алфавиту'),
        ('period', 'По периоду (от кембрия до мела)')
    ], default='name')
    submit = SubmitField('Искать')