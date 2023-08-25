Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA7ED50B
	for <imx@lists.linux.dev>; Fri, 25 Aug 2023 12:25:19 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-59289606ca6so10142047b3.0
        for <imx@lists.linux.dev>; Fri, 25 Aug 2023 05:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692966318; x=1693571118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=imTtF6oMDfUUdZZOXaDJRn5vC8nuYTa4GJ6U0uaioBA=;
        b=LjrX5q74j68I1VUl5oO9TUBIMmOBTPj1Vwy6sA95yTKrKny16GyqMuCQdgRCJS2sSf
         UyO1ObVQ3ldNV4uvynAiIi0Xw6LVJPGWO0XCW7F2EndaB9TnUNtxXTpceKVazPHulz0T
         lcmoPSbi+9SMB9UkWv7CQC4MHQm0sjDdLAHz69csq8RrwX5fDFGCMmzGRsm5j5mkno5W
         8EeFqLMHe3jsA1B7VuoUPgPOLFGtGeUv72Oa5cvHCDU/ONZ7bD3/4sK5SDY/SHs45AdE
         wbsQey/XRGdkEQyTeblklJJOxHVSpXRSVfKLd7Q0/MEL+96lUlvSNdKxStk5EzKxnlLP
         UT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692966318; x=1693571118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imTtF6oMDfUUdZZOXaDJRn5vC8nuYTa4GJ6U0uaioBA=;
        b=UpaUIw5r3lVk1tqdQ9ITRygLH3WY+VJe4vnMDZU61jOufpdAP0JgAVlyrGHQUkJn9V
         MKpzJJtjU2DMoflAcudp0K0uPTinIcr02pHrtX4Af2vGopQURfPFF9kYCVw7uve92hnj
         S5+3e25c9cuJBBeWKXmdUZjPXpO1AwF00MnQ6Ey2bWXXW/oU3nxvuDXi11T1UdtXMQFc
         KWmzycmvLDysFlzCYQ8tEtqDwIRm/oSBMWLxo79LR6Chbope5UYoDKhyPDmnQCposaxl
         4IJa+qCLuRpD4iy0WIgPqOkV0uYLSQq3e0O5nHeiEgOjd5xohA7Tlnus1TA+GPlMRG3p
         mXjg==
X-Gm-Message-State: AOJu0YysNit1IoThYn6Hc/CjcMMFGkKnG4EMeyzhThAN5764RfS8nSbF
	7tYCeys/LpdblrKkY8zhmJxHoeRzCccAu6Vk53o2wQ==
X-Google-Smtp-Source: AGHT+IGzX+k1WodF6SQPMN6CDVYnV4vxVt6RIf05NBatVhakz7fxdBWuUoY22uoRqj2+6v0uLXCfzghx5tVitq3nYq0=
X-Received: by 2002:a81:df0d:0:b0:586:9ce4:14e8 with SMTP id
 c13-20020a81df0d000000b005869ce414e8mr15051293ywn.52.1692966318735; Fri, 25
 Aug 2023 05:25:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230818153446.1076027-1-shenwei.wang@nxp.com>
 <CAPDyKFqsn6kVjPFUdVyRxNDiOaHO9hq=9c+6eAK4N-v-LVWUPw@mail.gmail.com> <PAXPR04MB91858254554272C90822FED1891DA@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB91858254554272C90822FED1891DA@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Aug 2023 14:24:43 +0200
Message-ID: <CAPDyKFoV2Z=-WUiF3SgXqhF+K+r5QqsLgz8_hau0WKfZxTzYpg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: power: Add regulator-pd yaml file
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Aug 2023 at 18:35, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Ulf Hansson <ulf.hansson@linaro.org>
> > Sent: Thursday, August 24, 2023 4:27 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> > <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> > Liam Girdwood <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>;
> > imx@lists.linux.dev; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > dl-linux-imx <linux-imx@nxp.com>
> > Subject: [EXT] Re: [PATCH 1/2] dt-bindings: power: Add regulator-pd yaml file
> >
> > Caution: This is an external email. Please take care when clicking links or
> > opening attachments. When in doubt, report the message using the 'Report this
> > email' button
> >
> >
> > On Fri, 18 Aug 2023 at 17:35, Shenwei Wang <shenwei.wang@nxp.com> wrote:
> > >
> > > Documenting the regulator power domain properties and usage examples.
> >
> > As Rob and Krzysztof already pointed out, I agree that this binding looks a bit
> > questionable.
> >
> > Rather than adding a new DT binding, why can't we just use the existing way of
> > describing a platform specific power-domain provider?
>
> Can you please provide more details on how you thought we should implement this
> feature using the existing way? Very appreciate if you could provide a simple example.
>
> > This still looks platform specific to me.
>
> What does platform specific exactly mean here?  I want to make sure I understand
> what you were referring to.

There are plenty of examples of how a platform specific genpd provider
looks in DT. You may have a look a imx platforms for example.

git grep "#power-domain-cells" arch/arm/boot/dts/nxp/imx

The genpd provider then needs to be a consumer of the resources it
needs. In this case a couple of regulators it seems like.

[...]

Kind regards
Uffe
