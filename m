Received: from dd54918.kasserver.com (dd54918.kasserver.com [85.13.167.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092057DA95
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 04:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.13.167.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751258792; cv=none; b=fK0pf2LWFGIQqN4yb67BZ4n2VV57VYGtUJQK4N3RXxxX028K3yOhzPOtfGziKkb8LfvUAq6ju3nqruZKQIH8+5kl4OBWXbqrxE3VH1gn/MwejOx6ZVctas7kkG2LOyayzlfIQDRSH3afvdUZX31rjtg266A7kEZx9DSyJ9qzcfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751258792; c=relaxed/simple;
	bh=uQYEMJIAMxFt54p5C9odTtA27keWxi+3jFSwhp78F88=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OLU7YN7c/v6+qU3DGVNHnL/USwJ4oTrqQ1FNRZbBncg7LmVMt11kIhN0fAAvYvDxgDGmZdxGaJXLbdGv4VtUhgww45MS+/UAXiZkaLOHITe+eTC+o8sJLUoI0GhJ96AFxb21TY+C1gIDG4zivMZ+UouO2t4dTl0vD+3zV8i9D60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=KARO-electronics.de; spf=pass smtp.mailfrom=KARO-electronics.de; dkim=pass (2048-bit key) header.d=karo-electronics.de header.i=@karo-electronics.de header.b=U+LnXVeo; arc=none smtp.client-ip=85.13.167.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=KARO-electronics.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=KARO-electronics.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=karo-electronics.de header.i=@karo-electronics.de header.b="U+LnXVeo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karo-electronics.de;
	s=kas202503070814; t=1751258378;
	bh=MQEiCA64jRoe+4Q4HAhc5uROjPs+W2LELE2uGvHuU0I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U+LnXVeo1J1pNgGk1RubYeAP/r0grfqxsUxdTPu4+n5feKZ48KCwQ11nnymPFNDii
	 cCPRAKBwFhqiKCHpBQsdPXX5vlzmu6x9sp1fyUSLiD4HgK39bjlvv8Z0hoKxeeMEwG
	 1icWV6et5DMSWtkEktkPdwUahsLhvroUdS7VT+i/JephS9g5d77bOQypugc2Tja4dz
	 IkK8CXZvE2W4db1vAqSK7JfL2eFfkdELJJTblFquIg5QT5EKDs093g/2RkJshx65mO
	 HJ6zIA9Jeb2+AdzOVUE7xqjqiEHfFVimvYQ+OGysiOhGpGpR80psvAwCM9DmGdxgWk
	 CfLB55C+tsAnA==
Received: from karo-electronics.de (unknown [89.1.81.74])
	by dd54918.kasserver.com (Postfix) with ESMTPSA id F3EA7772144E;
	Mon, 30 Jun 2025 06:39:37 +0200 (CEST)
Date: Mon, 30 Jun 2025 06:39:37 +0200
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Bence =?UTF-8?B?Q3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm: DT: imx6: Replace license text comment with SPDX
 identifier
Message-ID: <20250630063937.589bc18d@karo-electronics.de>
In-Reply-To: <20250626-karo-dts-lic-v1-1-315f43121aaa@prolan.hu>
References: <20250626-karo-dts-lic-v1-1-315f43121aaa@prolan.hu>
Organization: Ka-Ro electronics GmbH
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Bar: +

Hi,

On Thu, 26 Jun 2025 11:19:56 +0200 Bence Cs=C3=B3k=C3=A1s wrote:
> Replace verbatim license text with a SPDX-License-Identifier:
>=20
> The comment heades mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
>=20
> Cc: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>
> ---
>  arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts      | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts      | 44 +---------------=
------
>  arch/arm/boot/dts/nxp/imx/imx53-tx53.dtsi          | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dts  | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dts | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dts     | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8035-mb7.dts | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8035.dts     | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dts     | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dts | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dts     | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dts | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dts     | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dts | 38 +---------------=
---
>  .../boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dts    | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dts      | 38 +---------------=
---
>  .../boot/dts/nxp/imx/imx6q-tx6q-1020-comtft.dts    | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1020.dts      | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dts  | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036.dts      | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dts  | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1110.dts      | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dts  | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lcd.dtsi     | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lvds.dtsi    | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi     | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi         | 38 +---------------=
---
>  .../arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dts | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dts    | 38 +---------------=
---
>  .../arm/boot/dts/nxp/imx/imx6qp-tx6qp-8137-mb7.dts | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8137.dts    | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dts    | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0011.dts    | 38 +---------------=
---
>  .../boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dts    | 38 +---------------=
---
>  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        | 38 +---------------=
---
>  35 files changed, 35 insertions(+), 1301 deletions(-)
>=20
[...]
> ---
> base-commit: 86731a2a651e58953fc949573895f2fa6d456841
> change-id: 20250624-karo-dts-lic-2f7366e6feb4
>=20
Acked-By: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>


Lothar Wa=C3=9Fmann
