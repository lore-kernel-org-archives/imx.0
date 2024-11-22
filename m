Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C849D13635C
	for <imx@lists.linux.dev>; Fri, 22 Nov 2024 17:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732295252; cv=none; b=gFbzvkTHuFNNFsg10lIbkGcGiBFDHc94Mc1zT2gWt7y9OYtC/sTcR7/O1H0a1cBzxJ1V1DW/axeYwS3tks40ZejwBictkm/iP2BvAfXZO2zyBdYTQYvytcbM8h9yGU5c61Mgtv3/THUe70Zg7B1uDlWyEtWk3wOV6gwKoS+rtQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732295252; c=relaxed/simple;
	bh=qHGeW+9YJHnoV8xlYG8Yntca2NxQVMAEhNoIhEt+6xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBdGOsU28UlxU7zvBoEsl2XamH9HTwF8Zbzjo31wtmxYGJdsbkcEd1fS9iNs7skFV9U4tH7HoN53G7O0CR6NmhLo4vW30dUf3GuZTA5Q31yjyJqmc/Cf4d58dXOhMXYphfmIkK26xVzpt/Nxspex+4WcnMtUp+p2g/nAJyq4N84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lHu7/UYh; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lHu7/UYh"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e625b00bcso2059797b3a.3
        for <imx@lists.linux.dev>; Fri, 22 Nov 2024 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732295250; x=1732900050; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0/2iR2t92OCH9/EybMxXNXRhh30tebsZGZl/G3WtQ4A=;
        b=lHu7/UYhQfE1yotfJKZ220/wJ61YPd8H4AW4ErYvNBaEzz1Nc87HThfX6/RTBO/G+M
         NkbVYICysQo3uzAjQUX/b3Vw/BM/QK/G+5rYy3l5pizJbj/tyCQDjm/9AUFyUHqknDlr
         stcVApLDq+QYMRez5gtbTlcbzBdx099KsSMT0KYhfzViOlBJ7ye/p49/Aq6mOr122MP3
         v3zT4sJ+nEcmie4ZiM75ZkKdAXKNbASE7EAbmaVAYUSmlFxqkCOiQdAs49W/3KEqdcYq
         4ENXqk6130PnaXADeMTVpRqcJXP3ngDWObqfNf3rPuWpOYXp9Q2h1FRIj1Ctw1wa0iCv
         9oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732295250; x=1732900050;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/2iR2t92OCH9/EybMxXNXRhh30tebsZGZl/G3WtQ4A=;
        b=JVyeVaN3t80vlQ0HlxgEOqqEi3RoWatETPlq6x+9bJ7/qK5PRFW3weuiUp1PBGvE+H
         cBbwq3DgZszjmOkBA/DzIEhPe0Q1yP3TrWKz/xr8QzkGVUjYqS/xNiQa4/aHAsJWhMNS
         sjERkp+3nJhCH26rZE6l9f0XxzEk/Mz8OCa5HAaFp695Zs5p6SS7uY8pM48KictBCpYk
         a/FinlGk+gQ53oZKrABphAQVyqJV1ZLyKwgn09RwMr9Rv+c1k/Dn1dqrowBNi0ZqiHHI
         PNjKFvTnoarBuR1NNmKisknfWMgB49TiLFfjIkhP/Wh0gVeLi8yWyj82dwjMIIs8tYsa
         2gWw==
X-Forwarded-Encrypted: i=1; AJvYcCVxA45YknKc9jWl33Ofsw1T4RiyDJjYiVNKfJdc44j2/8zuiePEhy6rvGf3PqiKmR1+8OY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6LheN6TPDZqcdfhWn0UNEAaHTWVMnYl6YKgkKG3izRxYduLol
	y+VdJTMlnHUJ4GLacaaqZE/AnwWPkGRhT/Jdb8JbAopgIkf2w3xjWVAYE5KuvdeyGPNBvQxCL48
	=
X-Gm-Gg: ASbGncvBBV56ytnMtZftx4nOrKeRTPjs7hoc9jqwNfUVgPOabvJa1NTbbf3ZOcNrKVp
	G29Llt/OVZtao43OK5TFhROqbfY+8uLUdtkcwN7/RQxPoQwz108n10Pugxo2YG1ugmZonneODeR
	Cgdyo7dYOhY5i500fJEKoqKqnyLEu6tnnXvdqBTGn6OlUDnjoD3cjSNaAtv2x289q8fclgW7aK3
	3vJ2eT6xVqIAnDYIu9AazyWoYHeFlDSn2JiRorS7+CliVRNvJVJmVdKNiF3
X-Google-Smtp-Source: AGHT+IGZvDpaoKhSksqbzMsm60Yp0W7DGNYEnn4YmD/coS4PDUIKaXASCZ3cNh00dMOu8rfdsP6n3g==
X-Received: by 2002:a17:902:d4c6:b0:20e:a2f7:8ab9 with SMTP id d9443c01a7336-2129f6ac33amr44650405ad.27.1732295250203;
        Fri, 22 Nov 2024 09:07:30 -0800 (PST)
Received: from thinkpad ([49.207.202.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba1b40sm18541705ad.87.2024.11.22.09.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 09:07:29 -0800 (PST)
Date: Fri, 22 Nov 2024 22:37:23 +0530
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
Subject: Re: [PATCH v6 05/10] PCI: imx6: Make core reset assertion
 deassertion symmetric
Message-ID: <20241122170723.s43eokayvnuhas4r@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-6-hongxing.zhu@nxp.com>
 <20241115065221.scfb2chnoetpdzu6@thinkpad>
 <AS8PR04MB8676D25A87FBF45E2B1D26628C272@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676D25A87FBF45E2B1D26628C272@AS8PR04MB8676.eurprd04.prod.outlook.com>

On Mon, Nov 18, 2024 at 02:59:59AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2024年11月15日 14:52
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: l.stach@pengutronix.de; bhelgaas@google.com; lpieralisi@kernel.org;
> > kw@linux.com; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > shawnguo@kernel.org; Frank Li <frank.li@nxp.com>;
> > s.hauer@pengutronix.de; festevam@gmail.com; imx@lists.linux.dev;
> > kernel@pengutronix.de; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v6 05/10] PCI: imx6: Make core reset assertion
> > deassertion symmetric
> > 
> > On Fri, Nov 01, 2024 at 03:06:05PM +0800, Richard Zhu wrote:
> > > Add apps_reset deassertion in the imx_pcie_deassert_core_reset(). Let
> > > it be symmetric with imx_pcie_assert_core_reset().
> > >
> > > In the commit first introduced apps_reset, apps_reset is asserted in
> > > imx6_pcie_assert_core_reset(), but it is de-asserted in another place,
> > > in
> > 
> > I'd suggest rewording like below to make it easy to understand,
> > 
> > "PCI: imx6: Deassert apps_reset in imx_pcie_assert_core_reset()
> I'm very appreciate for your rewords. Should the imx_pcie_assert_core_reset()
>  be imx_pcie_deassert_core_reset()?
> 

Yeah!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
