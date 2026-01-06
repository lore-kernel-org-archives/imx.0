Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79FB2EA158
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 17:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767720875; cv=none; b=EYgYGhDMnKmO1AcM8oL1Cl6W3RCZwqaX6aQHa+TNeLILs+UeCFlq4vpq+5fI63EdrMh+7i1Qvoj+SHMlo7gSLABuyZ7TtNGrzE4OreYN5Pyg90BE10sw9fYmLI6Wnox+qCwpmiBliIaqd18mOT7wrGaPK7k8PkwOpgPC5DUEyJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767720875; c=relaxed/simple;
	bh=4uAAVaBUqR7XbgPYM+b3TErNU92wyGwrj6qD+m/4Eys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtawLGHSi4BHxuGcM25MUuQYQ0xZ2smQ/fcRyqlmIm6xupqacaNu+K6Q2j0FGI404Sug1Yy6L5cLiWoD4NcYikYFKA02HXN7/gSArr0FG3ag23c+2L2e21xRjb1YeTjanJs6dfQyYdEFjzoj92PcFJDOKz7YVATDj65TqFrNi4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jh0WVdvT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GeL9Fxs8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jh0WVdvT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GeL9Fxs8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606B3oMv2684965
	for <imx@lists.linux.dev>; Tue, 6 Jan 2026 17:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jzSTS8fbRs1wSAGF7WUmIraz
	4oEVJgEJtLyxFPfHdeY=; b=jh0WVdvT/iHJCW9ccrMMRQSXa8S7RznjJF2rwsEN
	YKwyXrzMt1PfUGji8KYBTIfsqkOYc3GpQakVO9XP2+xjmyL6iXyXAFfb71sInSdv
	kWR7WbHq4o4RAv6mIDMxZHsbokci3U62YI6Paaf3X2NngzaBz4EKYYB4U667tyq7
	fn1r6oK0Nid52Eg2ESQNbj+OEW++qF/UfR9bcvHyZIrWkZcaUrFsLyPAiE/LR2Pd
	sydRPjtTZOWB7NNLg+Yzs9VHBMmrEhJ8R9K14MnudQhdrTihKF8rlaiHEKxKmnro
	t1+GLHOBC15gk5klSTnDod8Ij2r5Jn4z9szjZqTb4BWpoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgty5ja39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 06 Jan 2026 17:34:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso53989511cf.3
        for <imx@lists.linux.dev>; Tue, 06 Jan 2026 09:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767720872; x=1768325672; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jzSTS8fbRs1wSAGF7WUmIraz4oEVJgEJtLyxFPfHdeY=;
        b=GeL9Fxs8kFxPm5wioC6al4QV32pWgMHK/ij+EB4GfezRMX6AuopmjwAYpxk6QY3K3H
         EbhoqbGchiqReEF7Ewflz1a/TGnVovvdWPsrywNjfCEzafXNTjfHCEIw9PQi9ziJ4rxr
         w2KrVcfIvJ4gx0765u9+419XR/Z78VUWLFk4jXpkQeAs/LV77UVnX6i9S4nZyoMNSSx8
         JA4lvH3Gb7i1LAzlyOa+LLRAD/vRLm542zVrfRaFeTJ35M6PHsK73ybMAIb83PRk3KUc
         iJ6JQy/gc3jrfk0a0Bou+YEoGx8NtaJ78ZiRYVVJf7YwYvAOu4HjOguFYMIdfwAdILaz
         iHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767720872; x=1768325672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzSTS8fbRs1wSAGF7WUmIraz4oEVJgEJtLyxFPfHdeY=;
        b=hyplUCOfqiyM+TOARF4D/ZTaPP7tQYfQ8b+PHu6voESJCIMfPeoWfoUoZibvFGX5/L
         2L7gITB/pzb7g1DQbJGqXrRy/dd4+S8ApZ6SMWQymQaFfPAUrhjOHEkf0oTVwOxjgdt+
         WMsfY74VS5t1Jc/5Xa2Ec4kb86Qs7NWki/STiM7lQdX6qy8VJTEIH48XW2lCpOb4Qc5v
         ffwUUZ3rokQQIE/knfMt0qaydND7cdBXBprDktfoENEDiwAIW70ClTp7x3n+7yLg131V
         Alfh0mGtmPUSWEOt1dD05HdekShCf6tw9joEE0e28m9WhP3D2Nri8ywLo4W40kWquxEs
         lLUg==
X-Forwarded-Encrypted: i=1; AJvYcCUu16qpAuP3dnb/e9KpznzUfLQiMcS0vE4tBJpQVAeWq0EeAUViEbusUbkdj+tWsklpZZM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYkSt0vMxow1oxpmtE9sRBi1gN8mOd0gVQOcU6bXNSa6Q1x11s
	BsqNTXUA2K2W43ss111SlL/9kF/bbM7wR9PQp0ZLV+E3eJ1rblw2scJPQQickT0dwpHXCp38X3K
	ADfriejF8FuV4vBO/Ar9iRAiofB4iYXOp6ocp1c+x8DVFbx5XNSFJmM8=
X-Gm-Gg: AY/fxX5lZx5NJzhD7LFWwFMHkY6vbCWh543gVlH2p5h5+iCib4htx/3GiP/+ZHprjLM
	NaJQa13TnZlFdtJQtJ/NFVdhLWJBzUL8KB8gpPwDAaFRp38xrOFoaZ94AWYgrMIy/M4QOjaI+zl
	owgE/bzIqws5L1Ynh70GEBoEjgulJovQMw6Lf2v9hPEncqaX5PsNlKbK+xQtrkInSn7WnA7GiS2
	wquRvzWhw+8bE/rLJn75trBOskb4E+E4wBYTeJ2Vt8bun/2y1kfh71sS+QgBzi0J9K7WB/TZG1X
	IQgfxKy9h+OzHr/tb0NbxsskoFJaq5Y6PRmZda+JW5ZzGG0VGczKpskM9JhTz3PF4h3zvLjt8TX
	JKQ8TO3yNfP6tNtU1yI7X
X-Received: by 2002:ac8:57cb:0:b0:4f1:b9fc:eeda with SMTP id d75a77b69052e-4ffa77597abmr57402721cf.37.1767720871905;
        Tue, 06 Jan 2026 09:34:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsS5Q8M4Ax4uLqCekfjuM/TS7dC5bAY2/2l4KJvBIfjf+72ZUp+kPt+lte2C5fe//DuAlvyA==
X-Received: by 2002:ac8:57cb:0:b0:4f1:b9fc:eeda with SMTP id d75a77b69052e-4ffa77597abmr57402111cf.37.1767720871283;
        Tue, 06 Jan 2026 09:34:31 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5absm2551707a12.33.2026.01.06.09.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:34:30 -0800 (PST)
Date: Tue, 6 Jan 2026 19:34:28 +0200
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
Subject: Re: [PATCH v2 07/11] clk: imx: imx27: Simplify with scoped for each
 OF child loop
Message-ID: <pbmxwpyohpq3pi552pjwwgfe5wcj7qq7fx6lofpod5mq4bvmwj@sn4yfn74sgiz>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
 <20260106-of-for-each-compatible-scoped-v2-7-05eb948d91f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-7-05eb948d91f2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1MiBTYWx0ZWRfX3Z86QSL9/0pu
 aJdQSgVIubAkUMKQivsSlDSWYoYuacNi/tIG0DBGz52eXXFoDFtoFrvqNMK2TLK3XYHQ+s3D/ag
 tfj0iZ8ZDJHOaG6vMfXi3L/fhRR7+VQOS4Sq/tjQhetXcaLmE2mEQMuftAYpPFP5EoxO44EfpFe
 hSEVJ2WpHuXswGzglZO5UJjv4QrCnvu85S+4Ci5Lcc4tKc8IxFMZwAhHn/kstOYaiHs+F/dAQAV
 Djh/9x/g3/eoIVqWx+8HCmiU95mGbvch316bFewFAdeV4K2URd2slUxUMpv4H68ww81iqbwbTKS
 xiBv9NRijSpznsHgQRjUc67x7QTsM6hcEY3mI7X21HHxrlDImhvu1l0stOCuZmN7wa9BMS+FwLQ
 p+dYDUPqsb5OPESIbywOAIbyJ1j6h2zI7ZgDlpwObPINCbrbo2JJz2DJsqrjXa4FcDO1rbF5bod
 2MwqnBBEaiu5Jbyj8dA==
X-Authority-Analysis: v=2.4 cv=Rfidyltv c=1 sm=1 tr=0 ts=695d47a8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=_Ixbbux_C5oTi3JCwyIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: RODTtSH28zHkFUrvYvcJ5tLyrAmC8AG8
X-Proofpoint-ORIG-GUID: RODTtSH28zHkFUrvYvcJ5tLyrAmC8AG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060152

On 26-01-06 10:15:17, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Abel Vesa <abelvesa@kernel.org>
