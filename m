Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BFB1DF754
	for <imx@lists.linux.dev>; Fri, 22 Nov 2024 16:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732294042; cv=none; b=qGYCL9FUq/U9AHMpkrJrYf1UR1wGyWXGGH62K6ZLCr5Cpk3QQRIGx1IhJe22YBZ8z8XANnEZPmbKstJPFUflBy9aYfsWw2KvrxkfcwaUYDNdbwoTv9qrNR0D15nMW6I1MwmPEha66INpEPeTJ+3JabiA7NvMNZ+ULOauTd34wrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732294042; c=relaxed/simple;
	bh=ItNTKavT00h+piga1HTfcObBvAtBiGxqCrbjRJ1Tavc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJP3YA0F0E8sGDRfyBtJXi5oqXfgOEDyF7R984aBEZ72eTA0aWpdm1gHitGoDGvYkZiO8dz8RIayiK5/6tFKBbDFHYXQgkjvR14I6hm4kpEP9fu61ykyQCgdYvKLbdOPkrv1EoQRUuQ8GJLl1mLFluj55/DTf7iV9268tEPrq0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AZSWVU46; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AZSWVU46"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21210fe8775so26920985ad.1
        for <imx@lists.linux.dev>; Fri, 22 Nov 2024 08:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732294040; x=1732898840; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kzq5xBGhrLm4GuYMaG3vOjkgbW2jTLhEik+B/AfpKr0=;
        b=AZSWVU46ZyJsPeOYWv+Lmn/S2Hz5+9DF6+KZZ5uuTI+lX1vj5IuuOq5qLlxeKdG5vK
         PCdizBvEoeKuJI70W0OZ4A8BwqNVZwRgAYWsuMMtPKMsE6Ih6Y9QSSZGUp6sfQYPPyCA
         MPrwvqfcmVLvXgDYOJetcHtQ/uEEUGGEn2ivBVIZLHxeIa5Q3oqsEqhffJQKF2DmGaCd
         mojK4/OzQ0eWjeb7BwEOceBpM0PF2YuFiORJznzy/ePeeLiHufCRumWpgSPxt6EMA23J
         dD9lqYBV5QzesLSfjbEOjZjregfshtGGPmrMGVhRTUyguxu2T4GyxgqAG+h5htUnNKFQ
         yAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732294040; x=1732898840;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kzq5xBGhrLm4GuYMaG3vOjkgbW2jTLhEik+B/AfpKr0=;
        b=pk3BI+ajKbRByO2PkDngRgV2DeQbCLxdo8brtzBZjL51bLRaJQPkxhamt4rwWqnTyo
         5c2bVyZ5fo8mtro1XQeQpvu2F9+mMF7UDZNQUJf41zeS+8AK1UWocs2REeELMy/GkVrp
         SUIebEiAlqGSLC0Uyacwkk1j8uTOeM7FmD1Ncxouk8cnbfVsGzUP5PGoMsU3FxviNr8O
         UO5oIrljorp7KZD1UZLutpuvsGfM8CVNNnyLvOk132yCZWGhdsNnNdLf2LoAthsVIPD5
         qyIm+4JFviDODFDL2KP6aok4L0KJGc/3sds3ZyzcSE8p0W5FFvqLFUfjp6Ii0ldNP6c9
         wLmg==
X-Forwarded-Encrypted: i=1; AJvYcCVFZgwmMp81IA1gjhJwMa/MgsMaT9puFHvo8JjpMCMMSYH3eNyg0I3l7bMqh6JCA9fu/8E=@lists.linux.dev
X-Gm-Message-State: AOJu0YxS7Qy3bqnq9DeT+Ke8xWZP5/U7Cxe/+NbPx8ccoTsad1fDgyvX
	23JRPG0Y7CFWGea4mmt0tAkAWJM8muD6ORp1PLHGcqoTP3E/4v/8aUMNO75/Yw==
X-Gm-Gg: ASbGncuhoWOX9qJe/7EEsG+mN3ir98McyUr+COwhGCPPltilJQXmgvR21I8qyKezx5h
	1c5t36ogsPzKO+qilBXLpItuvK2Xfn2lK1i0/VryWA74E8Pkx8MvB4TkB/WEMBBkMevmJLPepRK
	rAYbUVt1SJtJnZvpMe1SZqQaO4fvB6EYvtppaDNqpxJR6mlU/GCtOwalCcYptjZhvLQHZ2XJ8gS
	hoo+G4zDZzrWb8F3Oe0iJpYT9Ct+rMlDJxYGSf9smJ2k6K8/rwMeVrHuT+f
X-Google-Smtp-Source: AGHT+IH2RH2HUiPHMzLk35ACiz5SeB6Uib1iKjXQGa54thdOMDLFrThNUfglBoU0p2O84vxcD04wlg==
X-Received: by 2002:a17:902:f70d:b0:212:35f5:b564 with SMTP id d9443c01a7336-2129fe2669emr56816865ad.7.1732294040271;
        Fri, 22 Nov 2024 08:47:20 -0800 (PST)
Received: from thinkpad ([49.207.202.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba357bsm18336365ad.88.2024.11.22.08.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:47:19 -0800 (PST)
Date: Fri, 22 Nov 2024 22:17:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 08/10] PCI: imx6: Use dwc common suspend resume method
Message-ID: <20241122164714.aj4dzv32zixdj7pq@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-9-hongxing.zhu@nxp.com>
 <20241115070932.vt4cqshyjtks2hq4@thinkpad>
 <AS8PR04MB867625A97A43FE5352FC0E768C272@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB867625A97A43FE5352FC0E768C272@AS8PR04MB8676.eurprd04.prod.outlook.com>

On Mon, Nov 18, 2024 at 03:00:44AM +0000, Hongxing Zhu wrote:

[...]

> > > -static void imx_pcie_pm_turnoff(struct imx_pcie *imx_pcie) -{
> > > -	struct device *dev = imx_pcie->pci->dev;
> > > -
> > > -	/* Some variants have a turnoff reset in DT */
> > > -	if (imx_pcie->turnoff_reset) {
> > > -		reset_control_assert(imx_pcie->turnoff_reset);
> > > -		reset_control_deassert(imx_pcie->turnoff_reset);
> > 
> > Where these are handled in imx_pcie_pme_turn_off()? If you removed them
> > intentionally for a reason, it should be mentioned in commit message.
> > 
> How about add the following descriptions into commit message?
> SRC interface is used to do the PME_TURN_OFF operations before. It's not very

What is SRC?

>  suitable. Now DWC common driver can do the PME_TURN_OFF kick off. Switch to
>  this common methods, and remove the useless turnoff_reset manipulate codes.
> 

Hmm, so 'turnoff_reset' is used to send PME_Turn_Off msg?

If so, then you need to say in such a way that the reader should understand
'turnoff_reset' was used to send PME_Turn_Off and since the DWC implementation
is used, it is not needed now.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
