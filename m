Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671236AA6
	for <imx@lists.linux.dev>; Mon, 28 Aug 2023 09:59:38 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d77f97a0e72so2991884276.0
        for <imx@lists.linux.dev>; Mon, 28 Aug 2023 02:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693216777; x=1693821577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8Ae2B/bJD6+pwU7iQXkYD7WW81UmVpdPoOKJ3dyD5y8=;
        b=f8Yzvy+q9p7b+uTEWqZMvv9SEdH8DMylAj82MSyBNZMaceHWqEOUBmJ2QPp2Fq0Jhe
         QZVJGaai3aWlYCwFJtU4A2K6OzSN0cFANsnL3Qjp2eilj8ChFys5NtfM3SC51dk7x0Li
         AdPbQwd7PlborWBlILgSxNJm6rqtxx5fFfLlJp73GpBlt5hjU/Hm0Fpsou0XZiw6r5R3
         0eg9Bghw94yVk/3e5KQqm3k0J02UvM+kA5BsCdeVpsvAqFoF2lvRh4wyiUzhak3DNBWH
         BlNx7NDUaV0vY33rKkfDAdOOq0kuqp3oR6RFxMc/hrKsPOJmhC+HXH4EDZ9DiYPgNMSG
         LkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693216777; x=1693821577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Ae2B/bJD6+pwU7iQXkYD7WW81UmVpdPoOKJ3dyD5y8=;
        b=f3ld03T7OzPlZsDQzsidS/eM2FmuMQHrcrw8ImtMpXK1Dd3duAa74LA1gH3PLK73X4
         15SziY6YK3oSLerXOiGWuvzY7jruy12ycJvL+T7aTLVRmoTJyu1ZWl1TaoD3GfxCNyzk
         dX4ZvX6G+Q6Tq1FkfvL6mLVUW01E17zGm7vPkz/eaOk4X4mB+xdKMlgGq4nIjOwfCVM6
         7z4rp03DJRsQESvecDyT4O1/e76flJuErGzKBpRi6lmrovhweYAf+7VpliUHQRNJ+0iW
         jcbFRYfkl0eIZlJA6wApj2X7K4NWb5O1iUURG7ww7JRjieeu8f5e7rd+doqwTFg08Osv
         Du8A==
X-Gm-Message-State: AOJu0YzK+eFq/Td2b4C4ry2agkuz9CWN7TrEMY7VwsuC4nZTqEL/V/2y
	h3HF9/9t0x3bhrduZeIfvfreVLMA0oVl4lT1oUg3Xg==
X-Google-Smtp-Source: AGHT+IEaCoCpMUCPjNNvMpqNFEuip8dU+C99qMdfR/6PRAdeSAMP7ht991M5faWrDlN7Kt9uuuksTVQFdukE70njB/g=
X-Received: by 2002:a25:2641:0:b0:d7a:c626:538a with SMTP id
 m62-20020a252641000000b00d7ac626538amr6186920ybm.62.1693216777261; Mon, 28
 Aug 2023 02:59:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230818153446.1076027-1-shenwei.wang@nxp.com>
 <CAPDyKFqsn6kVjPFUdVyRxNDiOaHO9hq=9c+6eAK4N-v-LVWUPw@mail.gmail.com>
 <PAXPR04MB91858254554272C90822FED1891DA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAPDyKFoV2Z=-WUiF3SgXqhF+K+r5QqsLgz8_hau0WKfZxTzYpg@mail.gmail.com>
 <PAXPR04MB9185F6AA20B0440B8FAB847789E3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <4e2c18e3-b1ed-6361-3998-5de060d2bcf0@linaro.org>
In-Reply-To: <4e2c18e3-b1ed-6361-3998-5de060d2bcf0@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Aug 2023 11:59:00 +0200
Message-ID: <CAPDyKFro6roynXuS1caARpMK08hvARQ7mQfiJcDgCyJXiw=nzw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: power: Add regulator-pd yaml file
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Aug 2023 at 19:31, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/08/2023 17:44, Shenwei Wang wrote:
> >>
> >> The genpd provider then needs to be a consumer of the resources it needs. In
> >> this case a couple of regulators it seems like.
> >>
> >
> > If I understood your reply correctly,  it seems that the current implementation of
> > regulator-pd is what you have described. Please correct me if I'm mistaken.
> >
> > The following are the diff of scu-pd and this regulator-pd.
> >
> >     power-controller {                                                    power-controller {
> >         compatible = "fsl,imx8qxp-scu-pd", "fsl,scu-pd";      |               compatible = "regulator-power-domain";
> >         #power-domain-cells = <1>;                                    #power-domain-cells = <1>;
> >                                                             >
> >                                                             >         regulator-number = <2>;
> >                                                             >         regulator-0-supply = <&reg1>;
> >                                                             >         regulator-1-supply = <&reg2>;
> >     };                                                                    };
> >
> > Are you suggesting to move the regulator-pd to the imx directory and add a company prefix
> > to the compatible string?
>
> There is no such part of iMX processor as such regulator-power-domain,
> so I don't recommend that approach. DTS nodes represent hardware, not
> your SW layers.

I would agree if this was pure SW layers, but I don't think it is. At
least, if I have understood the earlier discussions correctly [1],
there are certainly one or more power-domains here. The power-domains
just happen to be powered through something that can be modelled as a
regular regulator(s). No?

Note that, we already have other power-domains that are consumers of
regulators too.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20220609150851.23084-1-max.oss.09@gmail.com/
