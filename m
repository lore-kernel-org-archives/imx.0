Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F411192D83
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 15:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730214965; cv=none; b=pmZd3kym1hYZ5CEAuLaqwcD81qy5AjuW7NY5UXcmLTHVCzmZ7pwv8CqxcOBAaQ5VbSkqkhUwdzWDd4SS4AjWAgU8Y9AKdDCYu5vjViyN7fM+xQHYWcR1vvOVa/P0h3Ell93dcbsZd6aVx9zzUgn4TM9wtfBo1MC3jhoysJAIz44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730214965; c=relaxed/simple;
	bh=4grcFeJFMJkjfJV4QWMs+mwuoyc4z7UGXsc3aS2uiqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZTOQUoyOLUOGPH6LwchoU8AAVV6WODlYspLU1sjJynqcGf/QVHnunBGldRGkDzeYq4lZhKd5RILT0EgUMQh473LlEkOSTdwa5OCmj6TK+0oF7jBE9CaV/IZ+sTzCfrnBLfW+atRVcbI8vHLG0nw+MEn4GZmNOJ9gHmbA/T5WHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=eOD9XPL0; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=MDnpa8n3 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="eOD9XPL0";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="MDnpa8n3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730214962; x=1761750962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xnnhu6qFH7VFwsOlKt17qfnRuMYYX2PS9PBpQlWCIPI=;
  b=eOD9XPL01m5xUNfRWEQ8UultqEfjPOtFB/xPUEgAPKj+O+uNTh9HsyyN
   oCqq8qVIW7YRWB4hVB2vNvRBUktfrvJIFlaTpb4va+C2YpaLpKmzNlg8Q
   wxhNskF5srwvA0ghqtzTnpiFGZqCIM3DDm7dhB0hu2+/RuXO3BP7ToOFJ
   zRIywru4eVGuXsmX/kkP93v1nYu3NtLWB6KUnotqW45dh8mVXVJCayGjP
   aENRQJB49eHncfYVE7q+3Sver1qqMRWAkfJjWhcCmZz8aKGeD9+BT1MY7
   IK67eRmorr/NqMDb6OD/nhhgIpUds7Y29/51LGGYhRwxo1ul4jSqZlmoW
   A==;
X-CSE-ConnectionGUID: PlA3dqpiQhaNVhgQyoJqPQ==
X-CSE-MsgGUID: JmlQCz2uRPK2dCFOZprfYQ==
X-IronPort-AV: E=Sophos;i="6.11,241,1725314400"; 
   d="scan'208";a="39740542"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Oct 2024 16:16:00 +0100
X-CheckPoint: {6720FC30-B-86C05612-CA75E1CA}
X-MAIL-CPID: 1CB2DB3660D5383FF40F679AE29068E5_1
X-Control-Analysis: str=0001.0A682F2A.6720FC30.006D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD503168B60;
	Tue, 29 Oct 2024 16:15:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730214955;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xnnhu6qFH7VFwsOlKt17qfnRuMYYX2PS9PBpQlWCIPI=;
	b=MDnpa8n3IBHUOrIcd+jECea1KhhY6bp+B2dALBwARYqkeHJOrWutlx+gYBZLOlPY9cXyy9
	y6+XUfjIoQOyd/aTFFedW1ym7GbNogHvTPJ9nmGA8SfOCDS9YStKYXqmUaQ3h5Kk3CwXcJ
	ZlUbORR9urvdR+DNMrfGS5PhZoUd8iPCOgPZy2gIqhymGfUsh6IViued5A7U/CYzXNOesB
	NESV1WsNiv2kBamH/C6nUF41hr5zUSYKt5/3MRspDr/OJ40GiB+YUjTUBJ4QzWKHZjelNX
	nMSzeMf+GBB3qyUoRtbysfyz8JuPdst+uRww5M8yBk8aII7EweswwpFAHU/Iyw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, Xu Yang <xu.yang_2@nxp.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] dtbs_check warning clean up against fsl,mxs-usbphy.yaml
Date: Tue, 29 Oct 2024 16:15:54 +0100
Message-ID: <6099458.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <172917937246.288841.15901592420939223719.b4-ty@kernel.org>
References: <20240926073951.783869-1-xu.yang_2@nxp.com> <172917937246.288841.15901592420939223719.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Vinod,

Am Donnerstag, 17. Oktober 2024, 17:36:12 CET schrieb Vinod Koul:
>=20
> On Thu, 26 Sep 2024 15:39:46 +0800, Xu Yang wrote:
> > Some changes to clean up dtbs_check warning against fsl,mxs-usbphy.yaml.
> >=20
> > The first 4 patches are used to fix below warning, "nxp,sim" is only
> > needed by i.MX7ULP:
> >  - 'nxp,sim' is a required property
> >=20
> > The last patch is used to fix below warning:
> >  - fsl,tx-d-cal: 5 is less than the minimum of 79
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/5] dt-bindings: phy: mxs-usb-phy: add imx8qxp compatible
>       commit: 76b4f2a5cec59e842de4b5989eb990a2ee8cedf3
> [2/5] arm64: dts: imx8dxl-ss-conn: change usbphy1 compatible
>       (no commit info)
> [3/5] arm64: dts: imx8qm: change usbphy1 compatible
>       (no commit info)
> [4/5] arm64: dts: imx8qxp: change usbphy1 compatible
>       (no commit info)
> [5/5] ARM: dts: imx6qdl: convert fsl,tx-d-cal to correct value
>       (no commit info)

Did maybe something go wrong while merging? Only patch 1 has a commit SHA1
in this mail.
Also only patch 1 is available in linux-next

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


