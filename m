Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A39A72618
	for <imx@lists.linux.dev>; Sat, 15 Nov 2025 01:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763168513; cv=none; b=TIEV1LGdE6OL+5IJqBnhxqEZxzKw2biK4m/lEaAiAnCY9FDhVk7lcve1tFLOWTQxiEzgJsspe3Mx3Cux6fq3IFZmEz6cB5+4WTISQm78epAD4dwyZ6crLPrScRJvVmyVwa5uTaIptJ35UnKtm+adS2Y7CshKo3VILxiVGl5Y6is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763168513; c=relaxed/simple;
	bh=gsUGANyWWISf75HzA/A2RdSWS3eRalFSSqlVvn9iHVY=;
	h=Mime-Version:Subject:From:To:CC:In-Reply-To:Message-ID:Date:
	 Content-Type:References; b=LQrd65ZPPdCEBvi4b2obqVo7XSNaDDi33i/IY6gWv6h1A2uh0AT6BHLuvtERjVAiqiBsnmfN2CrTqtjWezjXVRfdi29Rs5c3GXoJK6vxeqW9FEZgotZmayFuO/McjtGfkUj++bszywVMxu86Qdb2TVUgARvz17xdzGyhpA0T7Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SD/TZQba; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SD/TZQba"
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251115010148epoutp02b754445df5ddc2a42baafb9e063ea0eb~4CGqjocQi0735907359epoutp02h
	for <imx@lists.linux.dev>; Sat, 15 Nov 2025 01:01:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251115010148epoutp02b754445df5ddc2a42baafb9e063ea0eb~4CGqjocQi0735907359epoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763168508;
	bh=gsUGANyWWISf75HzA/A2RdSWS3eRalFSSqlVvn9iHVY=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=SD/TZQbaJxUEQezb9y7/bsvi1l+nkVupvOYBDbdJZZcu7ziRVGPyzt57einkgYtAG
	 aRiRfl4A0ujLQcBqimGUTM+qie2PYDkZ2vtRJKgPUYYYMe5UsOxudXcWhGWAToOHX5
	 jzPD+oPBh4y1L5xi47KK5GRrhMm+ebL2iMT5UAkk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPS id
	20251115010147epcas1p31ffa568e5bfe0cd60591117ac123351e~4CGpdmzic2749327493epcas1p3Q;
	Sat, 15 Nov 2025 01:01:47 +0000 (GMT)
Received: from epcas1p2.samsung.com (unknown [182.195.38.107]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4d7bLf3grHz3hhT4; Sat, 15 Nov
	2025 01:01:46 +0000 (GMT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: RE: [PATCH] extcon: ptn5150: handle pending IRQ events during
 system resume
Reply-To: myungjoo.ham@samsung.com
Sender: MyungJoo Ham <myungjoo.ham@samsung.com>
From: MyungJoo Ham <myungjoo.ham@samsung.com>
To: Xu Yang <xu.yang_2@nxp.com>, "krzk@kernel.org" <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20251114074212.1214255-1-xu.yang_2@nxp.com>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20251115010145epcms1p5b7fccdadb889d9b88f447a73c9a8a7b0@epcms1p5>
Date: Sat, 15 Nov 2025 10:01:45 +0900
X-CMS-MailID: 20251115010145epcms1p5b7fccdadb889d9b88f447a73c9a8a7b0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-361,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251114074150epcas1p31037ab8f07810cbb5cc677bfc0cce01d
References: <20251114074212.1214255-1-xu.yang_2@nxp.com>
	<CGME20251114074150epcas1p31037ab8f07810cbb5cc677bfc0cce01d@epcms1p5>

>When the system is suspended and ptn5150 wakeup interrupt is disabled,
>any changes on ptn5150 will only be record in interrupt status
>registers and won't fire an IRQ since its trigger type is falling
>edge. So the HW interrupt line will keep at low state and any further
>changes won't trigger IRQ anymore. To fix it, this will schedule a
>work to check whether any IRQ are pending and handle it accordingly.

It is ok call ptn5150_irq_work() anytime during resume even if
irq-handler is invoked right before ptn5150_resume(), right?

Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>

>
>Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>---
> drivers/extcon/extcon-ptn5150.c | 14 ++++++++++++++
> 1 file changed, 14 insertions(+)
>
