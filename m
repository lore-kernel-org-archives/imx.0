Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB991A9B3D
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 16:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041047; cv=none; b=bhbiVNxYG0XkefOwiw4S7yf6lcTG/RoT9Gdaw/vuf4xOXUF3UQx9b5uaaCg++TPXKBK6D82OTAaNCHFlwRCm1Dzmr/A0J3s8rEtGfrkLz2KxSy1mwovZ42U+UA7WI5tBKwk2PO/GeNW3t9A4Gfx9ZhZBnHk+3Iefnflotgp9BfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041047; c=relaxed/simple;
	bh=2EDYynSAKdcNkoTKt2Z1SNAswFEK8/5Ov1+wsGM+KF4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QAfQ4gIDnyij7YoWXdJsRvc2tfrbO8Zgd1wf7WgfFF5evM4KYXfW5KaoOQ1UIys/tZC67RJsg1rTTZ90lOcWQM6jz3GuxE+cf1sRrFdEAPwkurkMX3ljc/lH/XBw+Zy6UKVv06qnQA02nnGgzA/V64+ydwD9oGggwGTOVWeKJzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBlM-0000VN-W7; Fri, 27 Jun 2025 18:17:17 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBlM-005e4c-2D;
	Fri, 27 Jun 2025 18:17:16 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBlM-000QIt-1v;
	Fri, 27 Jun 2025 18:17:16 +0200
Message-ID: <6b9d0c3d9c5a0338b16f32e37a759df836f2c004.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] dt-bindings: reset: convert nxp,lpc1850-rgu.txt to
 yaml format
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
Date: Fri, 27 Jun 2025 18:17:16 +0200
In-Reply-To: <20250602144046.943982-1-Frank.Li@nxp.com>
References: <20250602144046.943982-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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

On Mo, 2025-06-02 at 10:40 -0400, Frank Li wrote:
> Convert nxp,lpc1850-rgu.txt to yaml format.
>=20
> Additional changes:
> - remove label in example.
> - remove reset consumer in example.

Applied to reset/next, thanks!

[1/1] dt-bindings: reset: convert nxp,lpc1850-rgu.txt to yaml format
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D25ef956349a5

regards
Philipp
