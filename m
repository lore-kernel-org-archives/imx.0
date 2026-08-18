Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DA32F5A36
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 09:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046494; cv=none; b=q1SceFhZv3YLEevQlLy/vKbe/8JGkAytMR2NZGhfztKAtT89/OV2n8dqoJe5vniseraBiUcvhgNQQ0afsup2ygUQbWzKRLket2m87Gq5kqlEt7OkTWuozsMpErX9PV+0x17HnPJ2tlS0GrrqwD8DeZm6QG/rhXhkoT6Sj7AA9UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046494; c=relaxed/simple;
	bh=2tH1F8HjI1FLA1En8/6a5RXo2+lxNxdLkaGkELGlRis=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Pv/70azOzmrcJcW8AWmk6ydaAAennyDfd++1HgiwGuGnGl+6U58iOr7xAlXWUPoEFn3VSzU78QQhfta3FVYwJDPUZIICMyffAHPcbAhEiq4dEUhxhfYxWJh+oNF/6Ocfccb5Xm1WNF235TKrJykeK4fMdvxd1OL0ZxYZ6SDq+5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=eFViFbSY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LcqxPbya; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="eFViFbSY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LcqxPbya"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E8CC414000E7;
	Tue, 18 Aug 2026 05:48:10 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 18 Aug 2026 05:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787046490;
	 x=1787132890; bh=LpzOfzRL+RKds2nO/ZCN031cSoA6UfK8poijOaDDQtc=; b=
	eFViFbSY5j8ZPz5skKPG5qGmS01f0TUd4HHsD4A1TnBjBzF1Ca8IPUbZPBL7L3TZ
	+uoyloHOw+K2EpBiVnrMXif2Rgjt7GoIHp9M+AcuthYFNKCeiyKGnrEUlfTMlpHz
	y5c4wiAXQBOKY7jOF4UIo7/XoR6vNLHw4dRJijlbYMZQQfkFb+IOQKyKrAvgHre/
	Ja7q2G9efDKodv6pKvY7NckHl8GlNzmSJJBILGmbPD3RRKl0Vw/PW3tI+aQMkVpO
	J87f6ZclnlDq0x2wjwwhOXNMHShdISgi4XKJkh2FRGZNEWBTTQmKY5shz5ljIDLQ
	TaunEIC+EJbZUIvuuKj5fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787046490; x=
	1787132890; bh=LpzOfzRL+RKds2nO/ZCN031cSoA6UfK8poijOaDDQtc=; b=L
	cqxPbya+94RDpCAiPg0+cvbWvWnIGNUWpVVUEWkk5A9OshcFnkuaGyMJ+ZBY2/uG
	mbBoa33zrKYhD1iqf2WjznfKGGFh7VP30YqaUX5ydCaivJvy+0qRbb6h3CZThqR0
	pZRzv7uNedaSZrxIdkhn6wnjfG4XVZjt/OFV3m4m5CvQT2AioqbPHe84FLIBjCI8
	KKHfIWjPivjiDUAKiHdGEJNfcibKHpV1CWM9uxjKV041dIMdYcTgtwn/8gjSEbHm
	sbqliwDFxhc6HH3jg93dPZp3/JP5UZlyoZpdX3EcacSs05PrlAU7zzfSHFxMlwfx
	j9VjK27uO1FsD2IzYtsYg==
X-ME-Sender: <xms:VSqEagTQwqFNZ1i94xCiUQpRgAxJZr5n7bzo3qHSzgAOEUaW1lK1Nw>
    <xme:VSqEaon9FP41Q8VunJXb13mUbElhKalov66KHPgmhmI0alfOooALppPmrSOFzXHaQ
    6b54RYYpYrpAHrjXNMdU4u5oKlqq9dMp3R0EsuFdPVfKYg8rByR86Ve>
X-ME-Proxy-Cause: dmFkZTGXHWR6wAB3uAIvecQ/f9MmfJVr8MTChH8Q64AcuZL3PGLCd4AyYIYYHX+cwU7c5j
    m5rfTaKrHQoYQI2mXCcrznS+vkMWvQ2ZhAPeBT0g0NB601b12VC5Ab3o0Y822BWB/HlAp+
    DYv0ODDl61z3nSCF6cKy2N4TDi4WGXIGjRV+xqF1Ifd+c+viWYi9+Vh3Fgzq7mc7pRMh9s
    7EmOk3iyIGGqqDpHM0i7smggNja/7tf1pKE+0kNuR9iz98PU/idT198a620dlgTPLv2D8y
    qUhaVJBpV2n2Boa2pzwtwPHGaIVM3G3cMjiSNcsKOBk69BrYwSdsh5vZBaKlW5r4JTC4Dk
    3znTBlFb5lTxhSLKfyHnFx5WcdtZ9Dlm8PzWtt5q0hurv4l0JS3ruM5t3wu/dgPPZEfDH4
    evHHyhIDc/IKcglJCAg1R//1buH3MWjsWoReI/aaY4JY/3SyLqV85AiPCk996ebYvNTWZm
    TwWIj0EQQQGBI1TUAznkjOoP/PkFKpms/yb9C4FY4FOhUdYFMW22BLi9jpD2bBAUapzBOr
    ihpgGgPaWiJn3uQcpbB1KlcUau7eIfLs2iR/rMI1h7QsqQj7NxGph2MBK73SeOqpM/do2b
    5oeM9CTYulObr0Q6U7Z26s0dz82SEHR8AlGF0QBAVITPuUqNgFQ/qEt+KPDA
X-ME-Proxy: <xmx:VyqEamWE4n5SON-IQcskxmyQJNSjq004uxQGhQfYavn4pQlonYdHIg>
    <xmx:VyqEav_0nohIj62buEcP_nKBzCxnx20Y2adhoYJymMqChjNpBWHrlQ>
    <xmx:VyqEahvi4dGodJl4hGE4pAgRiQuuw0EWRQGUEuMc3JCG05xtq7aY6A>
    <xmx:VyqEan3w9bxF5rjwWCcAtamZUWlRXQRzuS3L8M6sBV9TeWSs5Zfr4g>
    <xmx:WiqEaq_YziWfQdkBf7kBYx4eITiepYlEQovd3CqmhQsFhkn0CZN8SPhe>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id BA88E32A0071; Tue, 18 Aug 2026 05:48:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Api_u1lkuwYZ
Date: Tue, 18 Aug 2026 11:47:24 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Daniel Baluta" <daniel.baluta@nxp.com>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, "Nathan Chancellor" <nathan@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Message-Id: <24e5979d-afed-4257-b9f2-f9bbe8914ad1@app.fastmail.com>
In-Reply-To: <20260817123542.48475-1-daniel.baluta@nxp.com>
References: <20260817123542.48475-1-daniel.baluta@nxp.com>
Subject: Re: [PATCH v6 0/4] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 17, 2026, at 14:35, Daniel Baluta wrote:
> DRM_MSM and VIDEO_QCOM_IRIS select QCOM_UBWC_CONFIG, whose
> ubwc_config.c calls QCOM_SMEM APIs unconditionally. On configs without
> QCOM_SMEM this fails to link, e.g. on SOC_IMX5:
>
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
>       reference to 'qcom_smem_is_available'
>
> Fix it by making the QCOM_SMEM requirement explicit in Kconfig.
>
> Changes since v5:
>  * added patch 4/4 to this series, which was initially sent as a
>  standalone patch (addresses review from Nathan)
>  * no other change to the series.
>  * picked up all R-b and Acked-by tags.
>
> Link to v5: 
> https://lore.kernel.org/imx/20260814141724.1006382-1-daniel.baluta@nxp.com/T/#t

Krzysztof pointed me to this series when I ran into the same problem
during my last minute regression test for the coming merge window.

I've included the four patches as fixups in the soc/drivers branch
now and plan to send this to Linus later today when the regression tests
finish.

Let me know if anyone feels that the patches should go a different way.

    Arnd
