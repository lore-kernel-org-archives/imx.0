Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66869D271
	for <imx@lists.linux.dev>; Tue, 25 Nov 2025 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764067243; cv=none; b=B81dCmKAliwwfRVnRkB9hotqBj66bf9MtLy1uVczdh+/1rHrtutFlkm8xFDh5V4XBLuZik/yP50gE/dZPAVPGL+vyrqszcGr9WJnzxGgqWXhM8OoOpI7c8aO/1YriA2Ixl5cjyPmGVKfxtrBWeHAew2A0rUqW2gntUlVw8Er8X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764067243; c=relaxed/simple;
	bh=ipYaxglVLpymTVZW64Iy8faXGWQ0z2w8egFblNhSFnA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qQ26LIFDYq1JSDRGwaqyETKT1ajn+nGvQvaNG4erJcFAQdRRtfYrbUFJatxq6Q0YrG9qBzxHUn+1aBPJIgvf55IMkdBn7bYZp7w9DYN4RMPWE8EYxKbCE2lp/Za/8699NT+AMqr/rNZ74VrkKxTszGthCgB9ykryhW+2tILqVIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vNqTG-0001bn-DK; Tue, 25 Nov 2025 11:40:30 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vNqTF-002NT7-2v;
	Tue, 25 Nov 2025 11:40:29 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vNqTF-000000003g3-3Plg;
	Tue, 25 Nov 2025 11:40:29 +0100
Message-ID: <9f07e541fc000d9065c1ff1716f1edc4c2278c8d.camel@pengutronix.de>
Subject: Re: [PATCH v5 2/6] reset: imx8mp-audiomix: Replace mask with bit
 index
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Frank Li
	 <Frank.li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Shawn Guo <shawnguo@kernel.org>, Fabio Estevam
 <festevam@gmail.com>, Daniel Baluta	 <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, 	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team	 <kernel@pengutronix.de>
Date: Tue, 25 Nov 2025 11:40:29 +0100
In-Reply-To: <4a022153-009c-44fd-8c4b-39819ae69390@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
	 <20251114133738.1762-3-laurentiumihalcea111@gmail.com>
	 <aSCHjNqj3CV3ahX0@lizhi-Precision-Tower-5810>
	 <6be8a682-6c72-45c8-be0e-880ab66045ff@gmail.com>
	 <aSR8q5cE/XXbZuF0@lizhi-Precision-Tower-5810>
	 <4a022153-009c-44fd-8c4b-39819ae69390@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Di, 2025-11-25 at 01:59 -0800, Laurentiu Mihalcea wrote:
> On 11/24/2025 7:41 AM, Frank Li wrote:
> > On Mon, Nov 24, 2025 at 01:28:32AM -0800, Laurentiu Mihalcea wrote:
> > > On 11/21/2025 7:38 AM, Frank Li wrote:
> > > > On Fri, Nov 14, 2025 at 05:37:34AM -0800, Laurentiu Mihalcea wrote:
> > > > > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > > >=20
> > > > > Replace the reset map mask with the bit index to make it clear th=
at all
> > > > > reset lines are managed by exactly 1 bit.
> > > > I don't think there are benefit because I met some periphal need a =
magic
> > > > number to reset.

Toggling multiple bits in unison is different from having to write a
magic number to a register field. The driver currently supports
neither. That is why I suggested to change from mask to bit.

> > > Please provide more information. What SoC? Which peripherals? What bl=
ock control?
> > >=20
> > I can't reminder exact one. I grep some code
> >=20
> > [IMX8MP_MEDIABLK_PD_LCDIF_1] =3D {
> >                 .name =3D "mediablk-lcdif-1",
> >                 .clk_names =3D (const char *[]){ "disp1", "apb", "axi",=
 },
> >                 .num_clks =3D 3,
> >                 .gpc_name =3D "lcdif1",
> >                 .rst_mask =3D BIT(4) | BIT(5) | BIT(23),
> >                 .clk_mask =3D BIT(4) | BIT(5) | BIT(23),

According to the reference manual, these are three separate software
resets for three separate clocks: lcdif_pixel_clk, lcdif_apb_clk, and
lcdif_axi_clk.

> >                 .path_names =3D (const char *[]){"lcdif-rd", "lcdif-wr"=
},
> >                 .num_paths =3D 2,
> >         },
> >=20
> > mask is more extenable and easily support more hardware in future.

If such hardware appears in the future, it will be easy to adapt the
driver. Usually we don't prematurely add complexity for possible future
hardware.

> > Change to bit number have not big benefit.

It improves readability as it makes immediately clear from the code
that all resets correspond to a single bit.

> sure, I'm fine with the mask-based approach. The big idea here is to make=
 this driver
> usable in as many scenarios as possible.
>=20
> Philipp, please let me know if you're okay with the proposal. Will also h=
ave to tweak
> one of the subsequent patches since, so far, we've been operating under t=
he assumption
> that reset lines are 1 bit.

Given that the current code is already using mask, and if you think it
is likely that there will be need for reset controls that require
toggling multiple bits with a single write, I'm fine with keeping the
mask.

regards
Philipp
