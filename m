Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19972E11A6
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766131811; cv=pass; b=RXjVCnuGFGwoFgPS894G8DgURfmFfwlXPJ1ae0XY0RVNA94gZWz/a/+S2+JnOND7ikgrilwTPJmmKEqgDriWb/cnEsZ7h7d4zql2BDNjrFA9nVfu83NuA6t09owDu07jUFxefh7jgo1nCW+207Y6zbllBAOIN56RnrLqQ5q353c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766131811; c=relaxed/simple;
	bh=SshNRPgIyfZhOL9g00Tx3x9NU8S7Oou4WRUj0p6RJMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=igb4nUndB/x+CE3L1dBhv3jgYg1h7xTnSAzhPDfL00UmuUEncSqGmj2frkj1GmIeBNyeYPsiFGE1xsnL2Hx0AcAd8YKQ8z32b4MqtZGVLkTBprpjETAUGhAeQL8yOX33VpyZPzoowOuby/lbf9m9/gz/OgB5wKy2x635FEvFpdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qwCSJdF3; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qwCSJdF3"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9ZkmG5LDdBWcr5F9UYs40lXE33P3xPwDRyGsRHQ2ZJw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766131778;
 b=C9TZhxnV39qLcTvjM8n4g3zqJRxDEVnSOuEFsGdZfpTzzlukiSDGkezr59Nr3GwWWErUTkZw
 N/e9/HIx41t7QG535PUsGKB8d2rBD2+aaSllzYVGURGWtCwc8W4SXoXTTNx6SWQdZ8yFtzKt5Wo
 06mRd/HzVBb2niDPMvNMCEYzFuwsCS8xJtimi/Mvm4SdG0Shxzpa1qil1mwPJQwL2QQX65SFkQl
 FhNOcGnTq5etGX15rkKIH90/qO/ftdSLiBf/+CiPOti4h6FDA/Z76oMwHTEhWdrGIJjkJpUYn4r
 KT9TGpDFiWcMXd0Z8CFrSK7B92IU/f8SFLGhMxE8iNwpg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766131778;
 b=XMrzvR+ReMcM9rnjSSU8bDVEX8KaUx/PUn5SUAv3zNmq4cGibYUb0DuCP2HZ5fJw2Svwz6xw
 g8CrnvmkLCWd2hPTN5WCCXpqUUmdWJ2iVh7Onl1imabQFLhghpST/5wzNo9wBvrlGbImx8iKqHd
 TXnAR9A8fZI12GAZaTWrvYrhV9MzlnFUJadhNQDPLPW3t/FccOXb++uQbPcrd+mGihD+EKvyv17
 VjUVkK97kS3v7VBmKMghrFeB1BJRVyAGsa/UcsTZhDBZlYHPz1XgIwAYDrB+obsexXzEFxC01LG
 LMV91+It5UHhEzKIhFqW3fHaUbQlYviIhIwC8C2M6zgpQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Fri, 19 Dec 2025 09:09:37 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AC51CCC0DAC;
	Fri, 19 Dec 2025 09:09:23 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject:
 Re: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names property
Date: Fri, 19 Dec 2025 09:09:23 +0100
Message-ID: <3357591.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
References:
 <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
 <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dXgDN6fwtz3yb91
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:5b88bc5d9b014baba218eed2fec8b5d2
X-cloud-security:scantime:2.167
DKIM-Signature: a=rsa-sha256;
 bh=9ZkmG5LDdBWcr5F9UYs40lXE33P3xPwDRyGsRHQ2ZJw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766131777; v=1;
 b=qwCSJdF3o0O8sOhmE8JhFdSc///M76UnUWPtSxPh0Js8oIqSnKQXIlxygaDKCvguOlFPDYHG
 ifHPj9nVG+OlmsHMfRzFh8ZukFT0X8swbDnwqOkZpYVLKPFnt7F+/tSgazmt1aA42LpKwWlHQN6
 5QZhK9Vtw9ICplvK5hsy541M54aa9t5wEk0HcYGSas/7+1rrRtdtsSpWO0Mcto6nuzfYslkgI5p
 DWNABlPNs+pNUetn/dU6wazvT3NBlWJsLvnh/nj6R6qFjSPbshWn7INyMimdNVc6U9hEEjPz4zA
 mB/eCYhsA/rBoLkym2P/A2lM/iVb8y8uxZVnDR+GRK95A==

Am Donnerstag, 18. Dezember 2025, 16:26:10 CET schrieb Geert Uytterhoeven:
> Hi Alexander,
>=20
> On Thu, 18 Dec 2025 at 16:21, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> > Add "clock-output-names" which is a standard property for clock
> > providers.
>=20
> Why? Isn't that property sort of deprecated?

It is? Oh, I wasn't aware of that. Maybe the property should be
marked deprecated in dt schema then.

Thanks and best regards,
Alexander

>=20
> Will be replying to the cover letter next...
>=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


