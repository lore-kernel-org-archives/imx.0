Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6659337EFF8
	for <imx@lists.linux.dev>; Wed, 29 Apr 2026 15:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477312; cv=none; b=SxK/Oz82uFrgX037ZtdLoQa41ltMdKpCRO/RhP34Lfn6j4hFXVMiD9qEwFQREgMS0hLNcLHmr5KmsShE/QzCys+5GMGsBQnyjrgCOnu/eF1a+SvvBtKQ6B99kmAcR0VNiLS24fjxMzTZ/mQLJ4/Ed6xEG7d0JEmF/HtfS1DttY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477312; c=relaxed/simple;
	bh=ptDOA8oXfBcLNX1p/12OZLzqrk1BS6t5onLGu8IEt8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VybG/Zh66nYnqf0dNaP+nx7E4J+Lf78Y99PkxTHdU3tb6FinavHpe8n+ppdjQ2n9aEataa2iFc2ktygMkhGrEkeH8hZ4m8oZa/CLc6e6u57OqNNggyAcMzPzpRo2er6e8YLhvY0G8/8AGG1n/JOraXyUYizMcueB4U116aCJF48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E19sEpZ6; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E19sEpZ6"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c76c60c7502so448051a12.0
        for <imx@lists.linux.dev>; Wed, 29 Apr 2026 08:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777477311; x=1778082111; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h8L+nXE7L85P9lNyL2I2gs9CTUVcJOwgVrd7ZFlSaCE=;
        b=E19sEpZ61ByMpXZnIxmILzEq7EgMpV5qIeRKC+EzlHgU8olIxGD+fsMbEV7bZUO9Ve
         BbP0MgjczAh0CjA+jIwZzIO3OdMe2DQVaVY6IepZx0Qk0/fOVQy4jRDhKrUXsx452Bmy
         CTzMbuDsc1tL0+yMHR3jzS9MKxIesbjETOyL/UaN07uDptxzzTsBdiWt5I1rOGhetvBI
         dl7M1g+bzzvp1r/rq92Tlt3kJAdJrSf4Eckd3TS0t25nGkx6LJUB5CnWVUNqpJKtctVg
         xH9HCGIs08XEHY9S0HzFnawP0HJO2Stu3VVd1aygA0ImsXA9W1IxBUr9WgPVFTU2lwv7
         eabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477311; x=1778082111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8L+nXE7L85P9lNyL2I2gs9CTUVcJOwgVrd7ZFlSaCE=;
        b=mmIKxM1g/MBwcuYIENuyphiRAxDS5OI38ue1O1Hw0qncO8rJtuo4Y6AqwPX9NH2igQ
         YeLaXgQ0jt9yZUDBFrUeWGP7GTGAblaGoHzk7dlLEUxGo+RhRA2gIqwCaSajPpUwPcMK
         qrVOjqsXi4HjxcmSYRcidfb+efVYT36CPrAS7AxmjaMy/M2zXysw80fzB8AOyxiWClVQ
         IbMCLdtKO6X6LRyQjw5DVn3uwGJCs0/T5VZJ3uwn1mJ8MXg+vRgxMBIygzY/iHKoUshj
         C0yiIBGosZ0wcVOa9kgmARLYlM4PmWyuikSmJEo1yY1lcJMSX1ep4bITmMuSAREfKmVv
         WhBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6+BBQAFOwyfHh62uNLJCfsYsBGPJsTvtwP1HuW8NMBY8kNa39PwQVx1UchLvYYfJst9c=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeRXeWpgKptpNPE5Z6V5lEgE/z9baQnDQOg9/0qCR6qHZVXW6g
	MAfuDivnn0AQKF7LP5DQ/nPmd7heGLAULCEv9bcciiA+G3k0Fb1UCJls0zThYkyY5Kk=
X-Gm-Gg: AeBDievmaluhZn4MkGtViMtFOEygUch0l+4FbDQGbm4chLzHymkZ8FO66lZ0Z0gbQp2
	dbRar5zoH6HKfOHrLPPhu2LdePaoj+a0IRUFivz6G7sbMORohmlQAD31mnimh5X5TEgAe8TJ1tP
	USl95QBBDki1jJpc8mzoMAQijPv34HsZEfGyPtCvbQu8djScQ72i+8tT8HSeB+Mb0E1pPtKLQBQ
	/RMbfWfIR0/vUQGwUay/bex3QQlxRW+4T1r/WybcKoTUIvbCKhgvQdft/VCA3GAVHZezfEGXxe3
	lIfnHwkvGOVbLJozSLK8VufmYCuvYF14c8/hxaf8F75AmDvAyb1EY5mPzqlJD2LdA/hrGFbRRbG
	gU4Hk9vYoV/RDL8Duo7HEDLKNEDPMNeBKyRYo6xMjXP5JQmWCTG3NCVz7jE4FoIyCS7+F2CWq4A
	QeBgo5Q2zT5de50hcXON3WtDxxagH7I0+pgao00A==
X-Received: by 2002:a17:903:2410:b0:2b4:68c9:302a with SMTP id d9443c01a7336-2b9882388cdmr33673325ad.17.1777477310614;
        Wed, 29 Apr 2026 08:41:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8131:aef0:bb67:5559])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98899055fsm27045325ad.80.2026.04.29.08.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:41:50 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:41:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "Padhi, Beleswar" <b-padhi@ti.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <afImuoeHolxGgw3H@p14s>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
 <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>

On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Monday, April 27, 2026 3:49 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij <linusw@kernel.org>;
> > Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>;
> > Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> > Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Frank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > > > struct virtio_gpio_response {
> > > >         __u8 status;
> > > >         __u8 value;
> > > > };
> > 
> > > It is the same message format. Please see the message definition
> > (GET_DIRECTION) below:
> > 
> > > +   +-----+-----+-----+-----+-----+----+
> > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> > > +   | 1   | 2   |port |line | err | dir|
> > > +   +-----+-----+-----+-----+-----+----+
> > 
> > Sorry, but i don't see how two u8 vs six u8 are the same message format.
> > 
> 
> Some changes to the message format are necessary.
> 
> Virtio uses two communication channels (virtqueues): one for requests and replies, and a second one for events. 
> In contrast, rpmsg provides only a single communication channel, so a type field is required to distinguish between 
> different kinds of messages.
> 
> Since rpmsg replies and events share the same message format, an additional line is introduced to handle both cases.
> 
> Finally, rpmsg supports multiple GPIO controllers, so a port field is added to uniquely identify the target controller.

I have commented on this before - RPMSG is already providing multiplexing
capability by way of endpoints.  There is no need for a port field.  One
endpoint, one GPIO controller. 

> 
> Shenwei
> 
> >        Andrew
