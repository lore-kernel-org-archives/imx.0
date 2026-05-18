Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299DB3CDBAA
	for <imx@lists.linux.dev>; Mon, 18 May 2026 06:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779087510; cv=none; b=CDx/lY4636y9GMro0D+UeGz+uxKryYNYttRi4mVxm5+rvjJdJrUjZwiQzeCimWyMovCm4q11lOE8Gs/615bNl8gWPrXVa1QJvgp2G7bdp6sNuVCRGtowoOfcauASFddKO+tZsyuPiuGszszxVE1fgL0WYkj/z+KLW8uzdBCaycE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779087510; c=relaxed/simple;
	bh=ckpbqgs5shqJPvCBzMZPnwjiNzzYTA3QidB3KHAt51U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqrTROpObgARctfTzh4eD3D40eT/nmZ0GD75Oz4fbyUyGCwfjheEz3HFb3O9y2NO0OeJiUMGYJz9w1AnKzHIHZ9LTesnR47heHhM+JNePCtv1xlUftISOxuAAldAXiiLlAyRqUC89duL43YhywN+BMF1ykbs9Mqo9SrM8MiPl1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7nlHgDu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZENL6eEg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7nlHgDu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZENL6eEg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I2j2rP3269301
	for <imx@lists.linux.dev>; Mon, 18 May 2026 06:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BNm0P/bZjFz50FHQ/dGvilOp
	pAsbdM8goRfGTDaWVD0=; b=g7nlHgDuv4DoaJItVPkAN7izhmqHDWExDMqkusZ6
	+oqh5uRTL7mDem2MD6z7a+lpUc7KnCWU1x7EbVF3XUQZo0e5aZgNpSRF5n2peHub
	YGj21uooHZSFUA68f9qCAJNq0zxM02N00XDO0c4b9Cd1GAvWjctESjGUDyKyrT8B
	MtF9h1/E4icY74Oxv3sVTHy0iEXlAYZxbdOWZGWWsORuxuPr63tZM2EgJh0IcmWW
	D3KkxmGOx3/Ux8ucDkuquwrYPzVLbAa4U47QljHwZYSybQ+a5bim3W4XmUrSh86o
	p/VdVUhz/U58aThViaa8RY8wLN4x/I/Who8JTW/eLgAkKw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g525w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 18 May 2026 06:58:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514551d5f2aso92236241cf.2
        for <imx@lists.linux.dev>; Sun, 17 May 2026 23:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779087507; x=1779692307; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BNm0P/bZjFz50FHQ/dGvilOppAsbdM8goRfGTDaWVD0=;
        b=ZENL6eEgrAnDmExO4iOaYLIipeitSaPzdGo7/Fha0lAoc8ohe+MFTkUd0Q+/aQpPhr
         wC8YokicVd8eUbRlilFKxN0TIopnun9N82niO7pmvy6ilRUFTqWiEevxir6SR0CfU3nV
         91GPet345HtrEfoJdQFpD2hAV1MS7nCUDdM0f1IsI1N+vSFy0RAVmOCs9NJlXJd/bey3
         yciTenBybgq5Oxp/7ls1qek8HByuVXSu+KCOvByWkXppAB226YJ1Q7+8N0lV48czRg1N
         jGHpq1gj/ZC07xxpf5Krdnfqcn74jOaRw6y8NiNRfEwhFbq7e3FbXsGI6bNuCg6x83NR
         uPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779087507; x=1779692307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNm0P/bZjFz50FHQ/dGvilOppAsbdM8goRfGTDaWVD0=;
        b=I2pLwqE3I9QbEEr16H182o7G4yVj58avF8mXUf0AeqbUs8SWQmxeNDIcSXEpNYYmjv
         +dGz362+XcKEhZDs7TYzmFoHSD61SDVaUP9qEvZebfmz6H8AhVQJ+cwl5239k1sEeO/U
         OflLg2RKU22i/KSeV0YYqtjywT/RCkxzf/RHXDS6rjLxuieq8x8fr7Q5CA2fyAL5X4Jv
         bEMiH9j8/p5Md82oZFfAYC6QGZTyKB08q0AR9JA766/Fr4vZzE3/0wVfD/h8zfYDKyrL
         QHUB23kq7uXcgOfqvc4dzOCrpQfvX+P8HJGXkO040KZ22fm8BeHhhs8cudkow39y/7Rn
         semQ==
X-Forwarded-Encrypted: i=1; AFNElJ8PtLu54gayf3vuo+XpxRxREY0wTkdb+6i/v0TeHukX/5bW0vu551CZKxFPpY2B3SICE24=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9wTbZUuMmu0MQgBJpEitWHCX5eA8bCkChAqehJ6FPnR5b6ST9
	xylEe68MzCPgkuLNX4ut2qwvsqqGcnR+HXOHqlQ9FN8jkjGSfEar+gVBSnXlRy4R2uiEABuJNNF
	6n2gqbLHnZnEoCtPmo+u4DwMZxDjIiGpHN0lotyr+Eaq2nfmTz7bzKpc=
X-Gm-Gg: Acq92OGL2RCWOU6UwwpWab02VBLI6Po5I7QFfwXrpKKcamdOQbFoNWPfgX1lRbe0yuB
	0CqIPkH+VUe9nMslL9Gf72vWoXf+9LTudw0zMFFgv/FFH9M4dH/FjuAhOWKIr7+AX4bvzKcUibK
	whaIVDwnpJyXpXGYdVxTZgrpfx2kc/AqQ5lK+YcBEg8TDR5Fftk4xaHOEa5+dGS7+ehE/IaHn9G
	K7P7RkjFB4mq/0XbJpA05n5+JCxptIYZA7MT11SrCNpNNqgpVWf0uDsaaiIjvGfAF3eOxLlKlhg
	jZdVrpEfS0XtkaN1KaNUxdwFv2xsxqoX6wWGshBSl8Ww7utqJGMZWeZT+igxa8HfGuKjKe8++pM
	GNlrx7lSzRq+AIcP4weAZ6e/SHPqindgY09s=
X-Received: by 2002:ac8:7f8a:0:b0:50f:b732:202a with SMTP id d75a77b69052e-5165a04b49cmr191471131cf.27.1779087507090;
        Sun, 17 May 2026 23:58:27 -0700 (PDT)
X-Received: by 2002:ac8:7f8a:0:b0:50f:b732:202a with SMTP id d75a77b69052e-5165a04b49cmr191470791cf.27.1779087506469;
        Sun, 17 May 2026 23:58:26 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm35167840f8f.34.2026.05.17.23.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 23:58:25 -0700 (PDT)
Date: Mon, 18 May 2026 09:58:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Paul Geurts <paul.geurts@prodrive-technologies.com>
Cc: "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Message-ID: <cr4z2qzawe3hlhcr4lvdf5zmlnt4cfbec7p7jhyiwgk7dkkwlp@3gu36sd3afoi>
References: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
 <l5fcjw4okcpk3nl243xqn7y57nr2mjjspjdfl6m3pi6smx4phb@2qp722n22lyq>
 <GVXPR02MB109688D7C86DC2A63D8BA146FBD2C2@GVXPR02MB10968.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GVXPR02MB109688D7C86DC2A63D8BA146FBD2C2@GVXPR02MB10968.eurprd02.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2NSBTYWx0ZWRfX89oOfJvaV/8L
 ijAweCRe2uhQVKt1n/HdTsrqLhCKaJiH+ZkON95wifK7LWIQcxnfU5G/vTH0k/201AP0wh++RuJ
 CLr5mz2E74x0d3XjKHKMdrYmUPOGhPgxHOc+4hcQ/s8J6Hohwn8sECEkqiog/ZntkX5TIU0ErcM
 aeqV3teAYsnn8FvLzEERa4On7NY1krn+ww00LBSv+CFIa9X2eCYWMHVWSJSK8k9dE+rkxaJ0+ev
 CtVh4B3xYVRtdH2dU5XYc+7G5abIs2FMptwMmzeVY9TBCm9rgce3ij/rvs++VgbQf1Y1xueKLrs
 hl/AoovwCHdXh0W+FmUuja85uLZ+4ZiVv6wEeFM2CfSln7a47wmKk57VF4kNEph2XjcU5tfBx0A
 a5cZIiCWlNVBpb8SJw+xZBYJT4QX1AUwr3XQFSAJAlO2CWSQMOANGxhf+7s+40ssBETlyQyI2dk
 10ES1FRSChqzI3Z78ug==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0ab894 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=926zIK9uAAAA:8 a=GegrNMS54E6FrsLxTi4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=LlT7wNnaD8DP1V76ktP_:22
X-Proofpoint-GUID: OHBVBD43WNcPkbMkkxqJpYbLUNGgWYqc
X-Proofpoint-ORIG-GUID: OHBVBD43WNcPkbMkkxqJpYbLUNGgWYqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180065

On 26-04-21 11:14:27, Paul Geurts wrote:
> > On 26-04-08 12:13:13, Paul Geurts wrote:
> >> The i.MX8MM clock driver is implemented as module_platform_driver();,
> >> which makes it initialize in device_initcall(). This means that all
> >> drivers referencing the clock driver nodes in the device tree are
> >> deferred by fw_devlink, which are most of the i.MX8M platform drivers.
> >>
> >> Explicitly initialize the clock driver in arch_initcall(), to make sure
> >> the clock driver is ready when the rest of the drivers are probed.
> >>
> >> Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")
> >> Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>
> > 
> > Nack.
> > 
> > Nothing wrong with probe deferring. It is there to ensure the order
> > the drivers probe in is correct.
> > 
> > Plus, moving it to arch_initcall won't solve anything.
> I disagree, as it solves a _lot_ on my setup. But I think the next section
> explains it better.

Nope. If your setup has issues with the clock controller not probing
early enough, then your setup isn't following the upstream model.

Please describe exactly what are the issues with your setup. Maybe we
can find a proper solution.

> 
> > 
> > fw_devlink will not stop the driver from probing if there is no provider
> > that this driver is waiting for. And if there is a provider that is
> > needed by this clock controller, moving it to arch_initcall won't
> > magically skip waiting for the provider anyway.
> I think you have the issue backwards. There is no provider that is needed
> by the clock controller. The clock controller is needed by everything else.
> So the clock controller is not deferred. All other things are deferred because
> of the clock controller.
> 
> I understand that probe deferring is not there for nothing. But I would also
> argue that the initcall levels are also not there for nothing. IMO a chip
> clock controller is an architecture driver, and belongs in arch_. Whether this
> is the correct way to do it, or whether this driver should be able to be
> compiled as a module is a separate discussion.

By the looks of it, you are obviously confusing terms here. A clock
controller is never an "architecture driver" and it definitely doesn't
"belong in arch_". A clock controller is most of the time a platform
driver. There is a big difference.
