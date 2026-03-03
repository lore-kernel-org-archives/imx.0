Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816AC366DA5
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 08:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527795; cv=none; b=SmOD1HXpe+G1bLO9kX4D4Nmd3O4vR462JrPgnaZb16LscWm1IPOlHaoMtHNZGKYkojxD/JLbC76OPkGeCDpb8W2qTnIMm6DSKWvHEUCTzyZKHeWcm+UlbjPjJ+t5ovuJrp/sPfD6H0O3+rrhnWPgc76qCSgcKGOtzJfZX1rIDKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527795; c=relaxed/simple;
	bh=5MWhkdi4EnpIv5O5Lk9CmyyLKWnUH2vFRIZIMto4/So=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=HoRc77kRbMepS8bUtfxttb8FF2fjq9Upz3k8K7ViFOtAPmNWjLFIvpX+A0Mj8ueT7yaMwwctxYFK8rZr8Vfo5uNjMxvxTCPIwzhnJ4NhhWFwRA2Zini9mihAw+BAiVBeqIytmZyVdE3bM/PrfIZasjQW33qd09ZDKY63CeJYqsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yyl4e3Bk; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yyl4e3Bk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C9C7A4E424F4;
	Tue,  3 Mar 2026 08:49:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 826CE5FF29;
	Tue,  3 Mar 2026 08:49:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3958310368535;
	Tue,  3 Mar 2026 09:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772527783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k2kixXIwzcfNbHwd5w2xvnLJwKD/ZbAoWYUhKmFOtFY=;
	b=yyl4e3BkR1c9BpSKwiVJqWmRzxe1nONWInzsUl0vHpDj/Y6GdrEQS0g9cfjJFo4KIQZ7pf
	os9iwf+5+dn+7O6sZ8RFeOuYxf9FGwhr/8BicW8+2LmpBElfkk2DWv/51uSamKfjjHzOEh
	oKstnDmp5aZfKrkMfom9KtEXx5Cbo2CJIT/6XhLv052oWbtj/4oT/kQAv6yqu5eKaMyX3I
	ajDAfKFGPOoIbAK6vX6BiDRgTAclk42XXhxGSToB7onZ5OaAGGVI71XjIwFdK/cPhZgmwh
	yg6Hxi69iunSOOXCEteDKlnHkkAyZ79E4iaZ4TzUAVb12VnxxIuE/7l2M9BjjQ==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 09:49:26 +0100
Message-Id: <DGT0NIR1EE4J.242LILLFFMDJ7@bootlin.com>
Subject: Re: [PATCH v10 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Peng Fan" <peng.fan@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <frank.li@nxp.com>
To: "Marco Felsch" <m.felsch@pengutronix.de>, "Liu Ying"
 <victor.liu@nxp.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de> <20260302-v6-18-topic-imx93-parallel-display-v10-2-634fe2778c7a@pengutronix.de> <d97a9c0c-bdda-466a-8131-73799cdb20cd@nxp.com> <jyawx2cllg2jecdvx6bdfv4qiinfiwb6cuuwdhditpr2g2evee@qiox37ahgczd>
In-Reply-To: <jyawx2cllg2jecdvx6bdfv4qiinfiwb6cuuwdhditpr2g2evee@qiox37ahgczd>
X-Last-TLS-Session-Version: TLSv1.3

Hello Marco,

On Tue Mar 3, 2026 at 9:05 AM CET, Marco Felsch wrote:
> On 26-03-03, Liu Ying wrote:
>> On Mon, Mar 02, 2026 at 05:10:41PM +0100, Marco Felsch wrote:
>> > From: Liu Ying <victor.liu@nxp.com>
>> >
>> > NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
>> > configures parallel display format by using the "PARALLEL_DISP_FORMAT"
>> > field. Add a DRM bridge driver to support the display format configura=
tion.
>> >
>> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> > [m.felsch@pengutronix.de: port to v7.0-rc1]
>> > [m.felsch@pengutronix.de: add review feedback (Alexander)]
>> > [m.felsch@pengutronix.de: fix to short Kconfig description (checkpath)=
]
>> > [m.felsch@pengutronix.de: use "GPL" instead of "GPL v2" (checkpatch)]
>> > [m.felsch@pengutronix.de: add bus-width support]
>> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

With the GFP_KERNEL and double space dropped you can add:

  Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
