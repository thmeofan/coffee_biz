class NewsModel {
  final String imageUrl;
  final String title;
  final String text;
  final String date;

  NewsModel({
    required this.imageUrl,
    required this.title,
    required this.text,
    required this.date,
  });
}

final news = [
  NewsModel(
      date: 'today',
      imageUrl: 'https://www.tekscan.com/sites/default/files/HighSpeedBoat.jpg',
      title: 'Local Entrepreneur Launches Innovative Eco-Friendly Product Line',
      text:
          'In our city, a unique initiative has emerged - a local entrepreneur has presented to the general public his innovative line of environmentally friendly products, aiming to combine high quality with care for the environment. This new range of products has caused a real stir among the city residents, who are ready to support the ideas of sustainable development and a healthy lifestyle.The entrepreneur emphasizes that his priority is to create products that not only benefit health but also preserve the cleanliness of the environment. He has used carefully selected natural ingredients and packaging, paying special attention to minimizing the negative impact on the ecology."I believe that each of us can contribute to the protection of the environment, starting from everyday purchases. My line of environmentally friendly products is intended to become not only the choice of a savvy consumer but also a small step towards preserving our planet for future generations," shared the founder of the new product line.Experts have already hailed this project as a model of positive business impact on the environment and people\'s health. The entrepreneur, who cares about the environment and the health of consumers, confirms the importance of implementing environmentally friendly approaches in business, which allows for both the development of the enterprise and the improvement of the quality of life in society.'),
  NewsModel(
      imageUrl:
          'https://www.shutterstock.com/image-photo/sailboat-sea-evening-sunlight-over-600nw-717244969.jpg',
      title: 'Tech Startup Secures Major Investment to Expand Operations',
      text:
          'Venture investors have put a significant amount of money into a promising technological startup that specializes in innovative developments in the field of information technology. This substantial investment round has become a key moment in the company\'s development, providing it with a financial foundation for further expansion and strengthening its market position.  The startup representatives stated that the raised funds will primarily be allocated to increasing production capacity, expanding the team of specialists, and enhancing the technological base of the enterprise.  "These investments open up huge opportunities for development and growth ahead of us. We plan to actively explore new market segments, implement innovative technologies, and reinforce our industry leadership,\" noted the startup\'s CEO.  Experts note that investments in such innovative projects indicate investors\' trust in the company\'s potential and its ability to change the game in the market. The new stage of the startup\'s development promises to bring not only benefits to investors but also a significant contribution to the advancement of the technological sphere and the economy as a whole.',
      date: '22 march'),
  NewsModel(
      imageUrl:
          'https://i.pinimg.com/originals/58/7c/48/587c48648e29afaabf45ff2c0bfad6a2.jpg',
      title: 'Luxury Retailer Reports Record Sales Amid Economic Uncertainty',
      text:
          'A well-known luxury retailer has announced achieving record sales figures amid significant economic instability. The company, specializing in luxury items and exclusive products, stated surpassing forecasts and setting new sales records for the last quarter.Such impressive results became possible due to unique marketing strategies and the brand\'s flexibility in responding to changing market conditions. The company\'s management noted that despite the overall economic uncertainty, the demand for luxury items remains stable, which has been a key factor in achieving record-breaking results."We are proud that our team was able to adapt to challenging conditions and sustain growth even in an unstable economic environment. This reflects the strength of our brand and the consumers\' trust in the quality of our products," stated the company\'s CEO.Analysts point out that the successful results of the luxury retailer in conditions of economic uncertainty are an indicator of its adaptability and ability to operate effectively in a changing market. Achieving record sales in this situation confirms the demand for premium-class goods even in difficult times.',
      date: '10 january'),
  NewsModel(
      imageUrl:
          'https://media.istockphoto.com/id/1126132797/photo/small-old-school-and-vintage-yellow-orange-speed-boat.webp?b=1&s=170667a&w=0&k=20&c=3kIZLea7d0CPg2c8b5jaQMPVOeoH3MiAn0xfj78PWnE=',
      title: 'Small Business Owner Wins National Award for Innovation',
      text:
          'The owner of a small business has become the laureate of the National Innovation Award for outstanding achievements in the development of innovative approaches in entrepreneurship. His diligence, creative thinking, and commitment to continuous improvement have earned him well-deserved recognition.It is thanks to his passion for innovation and boldness in launching new projects that the owner of this enterprise has achieved significant success and recognition in his industry. The National Award is confirmation of the importance of his contribution to the development of the country\'s business community."This award is not only my personal achievement, but also the result of our teamwork. We believe that innovation is the key to sustainable success, and we are proud that our efforts have been recognized by the national entrepreneurial community," shared the owner of the awarded enterprise.Experts note that successful small businesses like this one are engines of innovation and economic growth. Supporting and encouraging such entrepreneurs contributes to the development of an innovative environment in the country and promotes the flourishing of new ideas and projects.',
      date: '28 february'),
  NewsModel(
      imageUrl:
          'https://media.istockphoto.com/id/475267604/photo/family-riding-a-jet-boat.jpg?s=612x612&w=0&k=20&c=pyNvEZEad4tm5MOKIa9dHifDbT4at-w_WpnWV1sXZRQ=',
      title: 'Global Company Announces Strategic Merger with Industry Leader',
      text:
          'One of the largest global companies has announced the signing of a strategic merger agreement with one of the leading industry leaders. This move has become a key event in the business world and has caused widespread resonance in the business community.The merger of two strong market players promises to bring synergistic effects and create a new powerful entity capable of shaping market conditions and setting new standards of quality and service."We are convinced that this strategic combination will significantly increase our competitiveness and expand the geographic scope of our influence. We are ready for this new stage and confident that our joint efforts will yield extraordinary results," commented a company representative.Analysts note that such mergers not only strengthen companies\' positions in the market but also contribute to the overall development of the industry and may lead to the emergence of new innovations and technologies. The merger of a global company with an industry leader is intended to change the business landscape and influence development trends in the future.',
      date: '29 march'),
  NewsModel(
      date: '17 march',
      imageUrl:
          'https://brunswick.scene7.com/is/image/brunswick/23_FIB_BL_FallUrgencyCampaign_HP_RESIZE?\$H-2000-2000\$&fit=constrain&fmt=webp-alpha',
      title:
          'Entrepreneurial Duo Launches Successful Online Marketplace for Artisan Goods',
      text:
          'Two talented entrepreneurs have joined forces and launched an innovative online marketplace specializing in artisanal goods. Their joint venture has become popular among connoisseurs of unique products and has gained recognition in the world of e-commerce.  The uniqueness of the project lies not only in providing a platform for talented craftsmen and artisans but also in the careful selection of products, ensuring high quality goods and the unique character of each item.  "We aimed to create not just a place for selling goods, but a true community of people who value craftsmanship, creativity, and individuality. Our success is the result of our passion for unique items and the hard work of every artisan showcased on our platform," shared one of the project\'s founders.  Market experts note that the successful launch of this online marketplace speaks not only to the high marketing skills of the entrepreneur duo but also to the growing demand from consumers for unique handmade products. Such platforms contribute to the development of craft culture, encourage artisans to be creative, and allow consumers to enjoy non-standard products, enriching their daily lives.09:58'),
];
