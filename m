Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA2E274FFA
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 07:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701435; cv=none; b=TSw2KgqV5BtFzL4um3I2yWIQqOPEheZQOKTdqENvmnlD5Vcvf1EK3TSsvrWONcEtLpY8SRKI2qJyiemkkhLvwTqdTcf3AMhlIcUS+42KelSGJ75CCTCAWbehMeeu+J0BdS0yV5LbYUpdl9X9sOJ3oqP9IJqs9s+eywjdn1iuzRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701435; c=relaxed/simple;
	bh=T8MD/T4X8uKn1XMHfC5HIhpX3DfNRuLJFkxyCHa8pVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqblMJkEFXKsXzvyB8zOIrKzmz2I2RgScpet3jdN+2OEdARKUTPsbVx8kI4CwkzBgUm6NSU7k1ZbbiBPky+bGO6npk/1NStbC8rT2sVYTaDkcrJXVdUIIzEhbEB0PqfIl5w1VGCGV7kMecPCHASk1A6nGCq6DuRC5SXHqacEsBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GK7x9mVY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GK7x9mVY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227c7e57da2so45490475ad.0
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 00:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744701433; x=1745306233; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jV6NGQFGLg4JdFHEjIqGuC71J4i1+oIq9oJnSeBlp3s=;
        b=GK7x9mVY5muEuSzgqMZ3SrpRTnzLtozN0YblXJYdPvLg+L3i7CKdn7/pVglSCQplWn
         AYUC3KlYQaufnGPDw2/UV5HwqTaViPVw+IX5RHbOSDSUCH1zw16KnJCLX4T4yBe1jyaF
         bjFLfy832d4Xg0JYdCPdQLAvOgnR+0sU3afQRD52o5DC4sAMOoiPPSmdii8W5AIBwmIw
         TUUGUUlxu5UWMB0cPLLLL+b16c0rFH2zzyPghLK63VdLRKZwiFdcOTJfGgp7sXGyg7yZ
         DBHEvvGZV4yj3fc/+YzvkZ2cHvEzWFQqXrmibYVh0CqLcvChZaABlsVQ9pq/lP7FdvQa
         ym4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701433; x=1745306233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jV6NGQFGLg4JdFHEjIqGuC71J4i1+oIq9oJnSeBlp3s=;
        b=GT32atlC8PdeDjnlZ3ufes6px+X+aw3CxG2UFNDyLC0QVXGk0XBfopSN+L+nmISS52
         CNRZUChZdsKmDVZcHm5QxYMyN29NnHHOf0OtqnKD1ZLIa6SPy3cv15WbrydTrAJrHDED
         pm6BKr3E69kfhsHADjWLN7KC7efcCIhWuSax1RSid3QI8hU/3TfUPOTRzuiI/t/fkuCB
         l72INIpLx/2+30Bw5IY8yPDdH/J/BobMIrlCrZoooaPBtwqpZinoVBAvxljWB4NYxCKT
         IDTodVJhnOYxvPeiT8aJKUFZWRxRplhPtzG0sKymXtRz/2gJAyJiEqvlYqL8AKEoiKYa
         aN/A==
X-Forwarded-Encrypted: i=1; AJvYcCXzQJquqHB0aVb7//q3HNBaCAmaNMaIpNAhajtjHpNxir0kGGq0Q/07/1k4rPMZQQNDkaw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUu+MHkkfehEkfjdzA7rL/bAXmcWclVDj/dx9geiYJK3Fg0qzl
	pG4s/10qXV+/iWTQveWbLIxB5rhcNCxrJV2WBRwnI1zQVFjARM3Ane94nZp7TA==
X-Gm-Gg: ASbGncsCHuJM++XQo6ZhH/Rpb+LRxmqL0tZ8/sm8ViSmApfThB13pe2O18HIxPRQT+a
	ckDlK5yOZECqNMdoG3v/KNeRJZp9gddCMz7CCk6G313Cfz6gxeseoWU7fi0qSNtyMZ1k6q67dQS
	auwD1vvmduecH7ASqRJGdt2c7cQaEuSTTQ6RDm7VrnnpTE9LmDPVIackTKB3BTF/Usjz8xf8pFR
	Qwvyffil9XEjDGiqlbob7cZEI3fZWYXwC0fcMh93udF87BUudRwgvj4qHrrbucYoxfuc3xLjJqZ
	pnZOMP1rd7Cu8DEfVtoGTNOz4QsoXVPeAQV3WLMoVm/U1+xdQQ==
X-Google-Smtp-Source: AGHT+IEsKIi1AC4jZA/ksxZU1y9WCKtKtWG0llGnvi3XAKZ2YzyptaNOJKPI/OvYlRGlImVjo9ZAgw==
X-Received: by 2002:a17:902:f707:b0:224:2175:b0cd with SMTP id d9443c01a7336-22bea4c3baamr218535905ad.26.1744701432954;
        Tue, 15 Apr 2025 00:17:12 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b355sm110106255ad.87.2025.04.15.00.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:17:12 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:47:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may not exit
 L23 ready
Message-ID: <cm5esahjwyoi5hky344nk2vfawf26hzgvu2rkplabav6d2r3gt@y4ypf6mdaapx>
References: <20250328030213.1650990-4-hongxing.zhu@nxp.com>
 <ovaomfvo7b3uxoss3tzhrkgdy6cvxi4kr2zxmqsfjxds5qfohl@t6kc4rswq6gp>
 <AS8PR04MB8676687332C78840B927E7568CAF2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <rqgl5jjauppyudgmugp34fillkeli3qkwf4uf2djghi6nslebg@pyi6rbwyduxd>
 <AS8PR04MB8676BB3EDFCF3E5A490AC0628CAE2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <AS8PR04MB8676C5D0DB84975D34C4C65A8CB52@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <4qrfkx3ckywcbk7qbjplal5j7v6sjs3zebeehe5dnrgjz2ej2t@krdwjb4xm2sx>
 <AS8PR04MB8676221C998474EF5A9B94288CB72@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <h7pja24zffl4t7653rjaamp6v2j5nmukbzq7rdajynemlyb6l6@3e37ggkparjg>
 <AS8PR04MB8676CFD0FA7BCBB06AC51B018CB32@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676CFD0FA7BCBB06AC51B018CB32@AS8PR04MB8676.eurprd04.prod.outlook.com>

On Mon, Apr 14, 2025 at 03:15:28AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2025年4月13日 23:39
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > kernel@pengutronix.de; festevam@gmail.com; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may not exit
> > L23 ready
> > 
> > On Thu, Apr 10, 2025 at 02:45:51AM +0000, Hongxing Zhu wrote:
> > > > -----Original Message-----
> > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > Sent: 2025年4月10日 0:44
> > > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > > > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > > > bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > > > kernel@pengutronix.de; festevam@gmail.com;
> > > > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > > > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > > > Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may
> > > > not exit L23 ready
> > > >
> > > > On Tue, Apr 08, 2025 at 03:02:42AM +0000, Hongxing Zhu wrote:
> > > > > > -----Original Message-----
> > > > > > From: Hongxing Zhu
> > > > > > Sent: 2025年4月3日 11:23
> > > > > > To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > > > > > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > > > > > bhelgaas@google.com; shawnguo@kernel.org;
> > > > > > s.hauer@pengutronix.de; kernel@pengutronix.de;
> > > > > > festevam@gmail.com; linux-pci@vger.kernel.org;
> > > > > > linux-arm-kernel@lists.infradead.org;
> > > > > > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > > > > > Subject: RE: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe
> > > > > > may not exit
> > > > > > L23 ready
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org>
> > > > > > > Sent: 2025年4月2日 23:18
> > > > > > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > > > > > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > > > > > > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > > > > > > bhelgaas@google.com; shawnguo@kernel.org;
> > > > > > > s.hauer@pengutronix.de; kernel@pengutronix.de;
> > > > > > > festevam@gmail.com; linux-pci@vger.kernel.org;
> > > > > > > linux-arm-kernel@lists.infradead.org;
> > > > > > > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > > > > > > Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe
> > > > > > > may not exit L23 ready
> > > > > > >
> > > > > > > On Wed, Apr 02, 2025 at 07:59:26AM +0000, Hongxing Zhu wrote:
> > > > > > > > > -----Original Message-----
> > > > > > > > > From: Manivannan Sadhasivam
> > > > > > > > > <manivannan.sadhasivam@linaro.org>
> > > > > > > > > Sent: 2025年4月2日 15:08
> > > > > > > > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > > > > > > > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > > > > > > > > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > > > > > > > > bhelgaas@google.com; shawnguo@kernel.org;
> > > > > > > > > s.hauer@pengutronix.de; kernel@pengutronix.de;
> > > > > > > > > festevam@gmail.com; linux-pci@vger.kernel.org;
> > > > > > > > > linux-arm-kernel@lists.infradead.org;
> > > > > > > > > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > > > > > > > > Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95
> > > > > > > > > PCIe may not exit L23 ready
> > > > > > > > >
> > > > > > > > > On Fri, Mar 28, 2025 at 11:02:10AM +0800, Richard Zhu wrote:
> > > > > > > > > > ERR051624: The Controller Without Vaux Cannot Exit L23
> > > > > > > > > > Ready Through Beacon or PERST# De-assertion
> > > > > > > > >
> > > > > > > > > Is it possible to share the link to the erratum?
> > > > > > > > >
> > > > > > > > Sorry, the erratum document isn't ready to be published yet.
> > > > > > > > > >
> > > > > > > > > > When the auxiliary power is not available, the
> > > > > > > > > > controller cannot exit from
> > > > > > > > > > L23 Ready with beacon or PERST# de-assertion when main
> > > > > > > > > > power is not removed.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > I don't understand how the presence of Vaux affects the
> > controller.
> > > > > > > > > Same goes for PERST# deassertion. How does that relate to
> > > > > > > > > Vaux? Is this erratum for a specific endpoint behavior?
> > > > > > > > IMHO I don't know the exact details of the power supplies in
> > > > > > > > this IP
> > > > design.
> > > > > > > > Refer to my guess , maybe the beacon detect or wake-up logic
> > > > > > > > in designs is  relied on the status of SYS_AUX_PWR_DET
> > > > > > > > signals in this
> > > > case.
> > > > > > >
> > > > > > > Can you please try to get more details? I couldn't understand the
> > errata.
> > > > > > >
> > > > > > Sure. Will contact designer and try to get more details.
> > > > > Hi Mani:
> > > > > Get some information from designs, the internal design logic is
> > > > > relied on the  status of SYS_AUX_PWR_DET signal to handle the low
> > power stuff.
> > > > > So, the SYS_AUX_PWR_DET is required to be 1b'1 in the SW
> > workaround.
> > > > >
> > > >
> > > > Ok. So due to the errata, when the link enters L23 Ready state, it
> > > > cannot transition to L3 when Vaux is not available. And the
> > > > workaround requires setting SYS_AUX_PWR_DET bit?
> > > >
> > > Refer to the description of this errata, it just mentions the exist
> > > from
> > >  L23 Ready state.
> > 
> > Exiting from L23 Ready == entering L2/L3. And since you mentioned that Vaux
> > is not available, it is definitely entering L3.
> > 
> > > Yes, the workaround requires setting SYS_AUX_PWR_DET bit to 1b'1.
> > >
> > > > IIUC, the issue here is that the controller is not able to detect
> > > > the presence of Vaux in the L23 Ready state. So it relies on the
> > > > SYS_AUX_PWR_DET bit. But even in that case, how would you support the
> > endpoint *with* Vaux?
> > > >
> > > This errata is only applied for i.MX95 dual PCIe mode controller.
> > > The Vaux is not present for i.MX95 PCIe EP mode either.
> > >
> > 
> > First of all, does the controller really know whether Vaux is supplied to the
> > endpoint or not? AFAIK, it is up to the board designers to route Vaux and only
> > endpoint should care about it.
> > 
> > I still feel that this specific erratum is for fixing the issue with some endpoints
> > where Vaux is not supplied and the link doesn't exit L23 Ready. Again, what
> > would be the behavior if Vaux is supplied to the endpoint? You cannot just say
> > that the controller doesn't support Vaux, which is not a valid statement IMO.
> > 
> Sorry, I miss-understand the question you posted in the previous reply.
> I get the following answer from designers when the Vaux is supplied to the
>  remote endpoint. Hope it can get ride of your concerns.
> Q:
> How about the situations when remote partner has the Vaux present?
> For example, i.MX95 PCIe used as RC, and a endpoint device with one Vaux
>  present is connected to i.MX95 PCIe RC.
> 
> A:
> " As per my understanding it should work irrespective of vaux presence in remote partner."

Okay, thanks for the confirmation. Please include this information in commit
message for documentation.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
