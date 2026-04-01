Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AA137DE9F;
	Wed,  1 Apr 2026 08:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775030576; cv=none; b=JIwK3TQrwGmEgF9S9mJwcaAQXcyWaN9nKo4fBU7qJctjGtrgHyv7ssQwR8/0SdLLl/WUFe1lCoDw4Q8108ewdKwnGe/aPzQjqM+iviChBIlfYw+2KJp+HEvyKVIniEIWka0LqcXD3OqtDWqCEv4KIP1qgbgfjRpYCITUi6rl2vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775030576; c=relaxed/simple;
	bh=Ign8BH+mfSDXyGFsdWSnbkmSAo0FIeOLr/WNbXWqZNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CLZOa57v2v44ggaly78iavRENQBmRkUDxhHsEjpH9tqgSiQY6tuGf4c784oDB3fMud+wTOIJfRvhpr4SQQ3P0VbgGY0qVgJqFTKXln1wa9o1A+ed6z2U2aCGU08Tzj6qXvfrZz4Gf1cIODhK4RU8EjWJAbwq6fnWWvAJCknJdVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XnhzjaLc; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XnhzjaLc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Ign8BH+mfSDXyGFsdWSnbkmSAo0FIeOLr/WNbXWqZNo=; b=XnhzjaLc9oezds1LCnGwb1JZdi
	xBGnuqrtNr7BvJPnP7lSR47hWnYBA7I9buCRu7+kTTA6XUax0J3Vgiz3ONcxk4RoegoiARjpHGu0U
	qj5kGscUn0FjG6073Y1wEnp/+zthaUlvNZplc2ZTJ++lrmX+co78HjYKcBcliv1kHKJUgO403ENPK
	PL8FJivmTcO7WcHJs/H/sqdgn1ALTuOfYygQeN7X30HnVZyuqJpf7j99QfKQg4nuJKFHnpJ/b3LHf
	8j9+6Z6WXO8wYSeZ05lz3iof733ul6Oh2Uq2T6fL7fIvKyJVU+omGvXUup/kSPMNcZvaBc6xP3gfc
	eBO+q0pA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7qXJ-00018m-1v;
	Wed, 01 Apr 2026 10:02:49 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7qXI-0007AT-2N;
	Wed, 01 Apr 2026 10:02:49 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
 linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8x-colibri: Correct SODIMM PAD settings
Date: Wed, 01 Apr 2026 10:02:48 +0200
Message-ID: <1955363.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <40dcbb9c-15ad-4765-9f7e-40a571f98fb5@oss.nxp.com>
References:
 <20260401-imx8-fix-v1-1-cb27398a6aaf@nxp.com>
 <40dcbb9c-15ad-4765-9f7e-40a571f98fb5@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27958/Wed Apr  1 08:24:34 2026)

Am Mittwoch, 1. April 2026, 09:26:03 CEST schrieb Daniel Baluta:
> On 4/1/26 09:40, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > SION is BIT(30), not BIT(26). Correct it.
> >
> > Fixes: 7ece3cbc8b1ef ("arm64: dts: colibri-imx8x: Add atmel pinctrl gro=
ups")
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>=20
> What is the general attitude around using symbolic macros for pin config?
> Like here: https://www.spinics.net/lists/kernel/msg6072866.html
>=20
> I think there are useful to avoid this kind of bugs.
>=20
> If I get enough Ack's I can move forward and replace all magic numbers fr=
om imx dtses.

Somehow I completely missed these defines :-/ That's a good improvement,
especially as SION bit is "custom".

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


