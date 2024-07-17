Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4969A1CA80
	for <imx@lists.linux.dev>; Wed, 17 Jul 2024 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721202995; cv=none; b=Z88zhz68PPa05d57dwIGTesAAuMbynK9+CuPyq8Td48VLafcFSum1dZJEgc8Xa1036+gtYiu2X0Bv/eXXQAw18aZTFSUB9RaPXDxhlTwjQZa5fj74+9MUwwlfg2uRyjFmv1Dgh9Of0xNmH0eEsD9btDDWtFCEDloSpZrPo9GMpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721202995; c=relaxed/simple;
	bh=urZJ1/84wIytql9BIcugNB1IyCTILe2NsmTy/SWnd4M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WTL3/mCQAoDVbADdmgWhRx7m42mBmP/dSD6/raAHaWRMbP4mdjoF/UwuRk6cAQhcVeROW9R/vwbAgf4TSu2pJPsoH0x0ovlDBPFU30OWY9f9GYojHfE+ujQTqgjrgFw1F/RHfFLkr/LlFSEBgCrecneg4myAwHg6zIKspPlEGIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pxpGccyb; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pxpGccyb"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27C88C0002;
	Wed, 17 Jul 2024 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721202989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=urZJ1/84wIytql9BIcugNB1IyCTILe2NsmTy/SWnd4M=;
	b=pxpGccybf6wrT60Y6gYN4tEb20R8rqUM/wWxuNqafOpanLoLTBtCSy2kUcnKmkEUwI7yl5
	SjNcy3cc/b2hvahovJe6IxQNE9G/Z6q89oma+DoHH/YbN97Q1i9+bKgIpNnjHG03iM/yyj
	cuUkEPCR/Yk2k6HsxpfWH+QQQ9akby9ZorzJseYPe0jHm+AauVtKKbpDF9UIST39yD736Y
	mmLebk0mk9fqvd7SH64kde7OdVNEQJP4VlZvwQ+wJs+0yF2vxPOGrpx4YENByPl/H13XcR
	a6TOpN8CVvFo/KDHZDvQRHLNumVGW+ckZqTOnQbHMNXOcFnhP+DyeeM8CD0KoA==
Date: Wed, 17 Jul 2024 09:56:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org (moderated
 list:SILVACO I3C DUAL-ROLE MASTER), linux-kernel@vger.kernel.org (open
 list), imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: adjust SDR timing according to
 i3c spec
Message-ID: <20240717095626.278d6e62@xps-13>
In-Reply-To: <20240712164602.3600659-1-Frank.Li@nxp.com>
References: <20240712164602.3600659-1-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Frank,

Frank.Li@nxp.com wrote on Fri, 12 Jul 2024 12:46:02 -0400:

> From: Carlos Song <carlos.song@nxp.com>
>=20
> According to I3C Specification(Version 1.1) 5.1.2.4 "Use of Clock
> Speed to Prevent Legacy I2C Devices From Seeing I3C traffic", when
> slow i2c devices(FM/FM+ rate i2c frequency without 50ns filter)
> works on i3c bus, i3c SDR should work at FM/FM+ rate.
>=20
> Adjust timing for difference mode.

The calculations below look quite complex, but if you believe this is
right, I'm fine with it.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

>=20
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Thanks,
Miqu=C3=A8l
