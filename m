Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9983629C33F
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 17:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767720713; cv=none; b=KHVWgsmtIA1UZrBmQQ9aMZTwJgHQmD8hSzChRGjezH7M/b1iWMVTtjsd26Cp5lQJoPLcoBxidaykJitjQsc8VpJKPQSXQ2modBVd/3N5kFPVYE0At4Pw1EpvScTdsWAOrTBA2D34kVg4/pNB9kvHIlhaJcUywK5GgMCytv/Qq2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767720713; c=relaxed/simple;
	bh=EGL0IOjXzoy4ERSdqnDv6XXP02+jdc63zjGvHi+5D/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOsES+wele3H6PJ/9RJXV/APkf1jWYfiYEWSWmEBL6gk5vRbGrfaA3DkAFLWI0/djV4afxGgLnC3HaKtRge3uRnOJnj8C9NoTO1W/pf4azgYMejzItTM/f9qf2RJAUQV/qhMW3joA1qTyTeYxtt5eKQrowjmW3iFsZfY5hz+EOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7Tf7qlm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCcQMw8n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7Tf7qlm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCcQMw8n"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606H1LeF822603
	for <imx@lists.linux.dev>; Tue, 6 Jan 2026 17:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tR7f3o3xDPesUQHU2saQhPf2
	QeydtE64EkpRoTZj7tk=; b=g7Tf7qlmPp+umH1OgIEt2FQrpO5qwZlUUNF3FQZl
	HX1biqamPP+S3QFifEQzy9jaf2AY6vUJoF35oiXAOiRcf7HT/JpD4/pZg72K+t3C
	meDtBuSkuPUtpQRnlMI+BCeSgCLoRWGj5N8RRhOo6SsvbQAXRKQ5aOtEhqcE4YPR
	ygNhShsgBjdp+RDjAGGEWH+YOvuR9jhO2qYJ+ElfM8hMEzKhE2ZNzViBqTb49Tjw
	g8keG8le3o/HfvDI8obGawr+Rnl4TKuHIH1Kg8+DmX3jYJUlfvHZ3VLXqFo4lL1H
	x1kiM89xYc8xh3TUYxYELjFWUpGO4KxiTuAZ++/yYVIrPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6e803b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 06 Jan 2026 17:31:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee1b7293e7so43819911cf.0
        for <imx@lists.linux.dev>; Tue, 06 Jan 2026 09:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767720709; x=1768325509; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tR7f3o3xDPesUQHU2saQhPf2QeydtE64EkpRoTZj7tk=;
        b=eCcQMw8nMNhjyZ/VJhr5q2QrYErElppfSjaeN6b8gbnLQZXaWNpLwU4Ky3v+ncQJj9
         u2p0KeP01VbDYpW7IMaS6zqryOldzTybFqBzxEfSbKWKD5nkwe4wNSK9ryBuH4V/xnx3
         jbCNmanv65Me4nRNgOf6Q/efDWYNIfiZgV9D/yB5KmpJnQtPuNmC0Jf7+rxeMadvohtE
         jYefasXmf8nr0eXUThgKyZBoj+vwXkCIkC74nd6lmJpRJg3JFeIohFA+MZW3jyQrgYm6
         FBRp3KPNvDnWqcdHg5r+E1M7sdJS/AWKp+59mKNeDczB8aUzV7vY2dWrNQiNhJyFP2/j
         0zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767720709; x=1768325509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tR7f3o3xDPesUQHU2saQhPf2QeydtE64EkpRoTZj7tk=;
        b=bEh1+khk4a2lRXooORVN8GWjSmnpRyiqJBfe7mz2DnlVIAuLNYWQuMev63CzyH8Qfl
         saZiLheNXfKtH3DX/1b3gpeLKfNqOJ2miN57LQL1GqBkIZxulc+nrD4pd2ly6lyZQ0nr
         2MO5SXxUytDH1k6/7QyBrJOWTKviHpTf/2yNpd0hcIU/eoucGcAnX8C7EAlQJtyhsDiv
         CELGSGx7LVC6Ve/AclJjVUHnD9ANmZ0EmwgImCsSfnSI4b8l9bpYrnh9l8l6BtAFbtIO
         xmF04J/N4MbgC96RfZdZohDMURxRtVjAzIRJa0w3G8nXnN3xZa3js3d2yACJBQso7Fsn
         2avw==
X-Forwarded-Encrypted: i=1; AJvYcCV/+rrriazQqI8KIFcToYYKuevN/bpfmadhhhFcy6ssy1JDDtMzVX37f0TnEU9txPyCb2M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRL/KNR1e7NPxwYk0DBeHZKnep/whYIRSvvC6fHogoZ63TL6tV
	DRcin7d9kRAlm7ODF9yaB6Irwsph+MLjZAalMtmj9B8VreJURIYHf9nUq0ElhlzR968jFMbNCa2
	ZznJY9U8AeR0GtbnojIXzPTVw5fWa7tph1eCzOC3S64l924Gius+rzSo=
X-Gm-Gg: AY/fxX4umo22QhP2ZXH1vrnD/BG9WN5loIpIE7e9y2bmFsEdcsWfYv1D4V0WllLETLW
	Y1MnvAp6Geh3lItumgoTvtpNbbiEGhHA1X4Jjpvbw1RLtMRglmmCkUcJoyQEf+8OGkptTmzcthO
	EUyqYzpEAS+tA88PkrJCsRZ8BjComoYvuqUGb/6J3Gf9D5h3rxrBexBd8q0nhSABeeX0M46ChEv
	+WOCWhu4oIrmp6tdwrLGzM19AR6/B8u85lVG+cRmZJB3L2qp0kbPGBCXLjkW8uZfS7zwbXtU7NK
	M4LdRHIX/+PbzbMtjcYolYmX5brQMSdhdPtbUEYx/si35KtJg2l91hfQ6Y0hk3JHeaNOfk6RV8k
	aLwJyEbNAGaYowFQeqE7t
X-Received: by 2002:a05:622a:60a:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4ffa76a115emr42211331cf.10.1767720708556;
        Tue, 06 Jan 2026 09:31:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjf7OwaOn3HaZf8IWNrZ2eDSIxGAY9pKKIzvqd/zwCSP5LN8zraKCLgL67UkescNPyjj5pgA==
X-Received: by 2002:a05:622a:60a:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4ffa76a115emr42210511cf.10.1767720707970;
        Tue, 06 Jan 2026 09:31:47 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a51183asm282053766b.49.2026.01.06.09.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:31:47 -0800 (PST)
Date: Tue, 6 Jan 2026 19:31:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, llvm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 08/11] clk: imx: imx31: Simplify with scoped for each
 OF child loop
Message-ID: <x2md7iusj467bjmmysckbkehooua3he652qqwr3yzaoka4sjm4@pk6uy7hq2lku>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
 <20260106-of-for-each-compatible-scoped-v2-8-05eb948d91f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-8-05eb948d91f2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1MiBTYWx0ZWRfXyxaDfieX20ur
 C1R4ftR1SBGsGJu2ux8LHlVRlyw4mcR4ZDtVefb7/juGU/e00qrs0627SEv/Pv5+5iRkKc3ahKo
 FkH/UCvc69uMhX8OZZyQs28Zt5rmm3J6Qqr5onmZ5UZhkFrKpezPoBU9XHp9XK2YfgG/7nGdYqF
 tpGkDl2ynDJ0z406t2AjldDBw2BcgcSCGaglJWKcncowHgJQu/WQ/JydFAcPUsrwKutZf+KuNU3
 rMnFUTb6gToxecpGDco7rVRvxK5RM47gYUjCZR4lsSmphhQHZGYo+QBacL9XH4zwVkBSz+FAZHj
 yxqWzLd8FA43MT3lzQNg+7PAiCwY4mDsXMldwPLc6OP6I18dU7jhHC5rZsCN9NswwfQyb/Y1bBG
 ICGndMyFRqlr0zTnkXp1Ut0TBqn8SmqTCjZ2HheEv1x+JXdNZvgCzE6ckOoTaw6/Si6U7T8JkZe
 9ZV8lQglMuM22ft7Amw==
X-Authority-Analysis: v=2.4 cv=F45at6hN c=1 sm=1 tr=0 ts=695d4705 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=_Ixbbux_C5oTi3JCwyIA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: Zny1Atle_anb7gy5qWMxx-3mTgQx1TM3
X-Proofpoint-GUID: Zny1Atle_anb7gy5qWMxx-3mTgQx1TM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060152

On 26-01-06 10:15:18, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Abel Vesa <abelvesa@kernel.org>
