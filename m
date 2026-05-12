Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329F63E171A
	for <imx@lists.linux.dev>; Tue, 12 May 2026 12:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590533; cv=none; b=qreKSJmf/us3Unl7UsfEwkctZo5X9MhxZQc6SUuC3YnoxRyFklg10Q4JTNw9Rfif42WoVvroai2io9jSjgXiQoP5bmf21Gu9kcecIa/qSws/4JInqDoiCP18kZLoMEdTyDJ4COerwpxalKrFFb2UOg3vKU7Xb/ks1zi+8fFhot8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590533; c=relaxed/simple;
	bh=XogVvcvi90AvvWQgm9fx9TiRwpye5Jkvt/Cl8lSnZfo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hepl/zKXx1HE1BRwAS27Jlt2eUcpos8nHfICjF1amrqpQ6zYMcXB1ynACvghyzVgyb4v8yawTCF7X5mm2jiGNqTShBd6csH0pUbeMS8flGpqTyIo+HoBBEAqsu5fxLKKOvAwmJloQ0vUQaY6bU4OGhOCO/J8OCGn53pritVcbN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiuOlbB/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JISLGOko; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiuOlbB/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JISLGOko"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB5Msp591860
	for <imx@lists.linux.dev>; Tue, 12 May 2026 12:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdLp6i7BNy+BYJ5K4nBEP1KKhbsqv2zxhW4M6f9mwfQ=; b=TiuOlbB/AgwHuWBW
	qs+t9ei6NI0us0ahBN/kkUaZ5BwlyLN/Jrizhtek2O1Rqn/n933rubRmaDLtGjLC
	U8MmoM45eOxUS7jyOhKa4vTvDVvGeRalV/U7j3PBqbpP230xKt3wsCYm4rGO42Js
	uO1Fl4SMQlE+y3HO9+Hr+u0JCVNW1+KjdGhkB28kaDZ8PaB/DiIKgtS7cFAa0A8w
	U3rrUsLxyk9fHTmifvFqr1hg+epkZAdZrZGUHfLL5GUtnrBd4JN5x8vyWAjbLtH8
	pGG5npPUEkY6mB1uBlgxMjs0YtvuvB1LcFxUdYhNCwqhZkyoem9005QZsUktn3GI
	Bn1qjw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319reh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 12 May 2026 12:55:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so4339853a91.2
        for <imx@lists.linux.dev>; Tue, 12 May 2026 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778590530; x=1779195330; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdLp6i7BNy+BYJ5K4nBEP1KKhbsqv2zxhW4M6f9mwfQ=;
        b=JISLGOkohAVvfYOjpd3OyXtvYy6I++x585n/04FOI+7l3BJo11gFEwJqp7KYLYzOvU
         4xgV6N0LpS008EO0345qPFKKW/nM+xSCKgd6jsKcs8RKzENeviwBhqrEqegJr3rcs99w
         h/Y34aNHHQTVv+Vn14ufKT9M2yHIFAZ/pIwHbNunYeovEG6ckIdBrqUK9OZUHa6qQU2p
         uD/7+6swR1kOlhS3yOzQivXqulwKr7XTv3dM/cGwzMiqSqnrfS0NhenxDoVzFoDKeLGO
         aCsUfyXefH1mytv+CDaETUxtLBGQMRnGmzivQTg/lL3J+tbdURjTbuMn99bi4EK7NnqH
         nbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778590530; x=1779195330;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wdLp6i7BNy+BYJ5K4nBEP1KKhbsqv2zxhW4M6f9mwfQ=;
        b=qk9VPyWozbHECmTdn7hir14DnsuRUDMXv8rpEqic0p16uSpfKHopwU5+ExpcYgLvWb
         yhwjtgeLG9gNCtPk+HKO7MMDKXAOzAk7JzrzNHMo8hi/eC8mkGCOYIDdla7P/1TvGBkA
         pGOSEYrr8Ql7b7i7LmAH73Jj3fis9m/o8Tolt9nm2puETWsdIr3/9xCy/ygVAys6CIi8
         6rv+BMemY7o+nK7MkWvNO1GrvEY/vsEX2mhZE3CfltqlW9hLUDR1zG4LLF5pIrpSsgY4
         Cr1CSMsfxPyg13sjCtsmYS4PgBndtCSDAu52oSQkfCsfsKFCcxKvIA1xukI7OPwHNtVj
         mAag==
X-Gm-Message-State: AOJu0YxV8hh4JOFcyCA5i3PzWpogXhnIAr8VCZPfrGbv6SjP9j9oE5Pr
	QiqSZ495LS3mPVZZk8uXTrvbC10EIwIVlKz51pHfS9j5JErrpALwPvPRQ1m6rNU10xW1f9ofcpg
	MYL/xhN93MU0q9M40uQWySdqrMIG/9b77+B/zcU2BC6rbjqt1uOie+rc=
X-Gm-Gg: Acq92OHBFzh+fEYBZlpE82ugMXskEtT3gJIr07BVkScz8Z8mDt6DlJIyCvw0UHdoq8W
	q6x6p5QXmkWkTjmRo967MwjELFy3wbFpPF4dSVwmewov0ITEuH9X+L2ypr25atf/gdjGilHoCIs
	53NVX0EZA9us9GH3h6pXz1r0iIerwYGSazLUjtLcYDmUV6XmKGz5vCgwEBJtJnhdVNv5k+vuByI
	0v+KEs+hu/G+/aD3qjglQBMGN8gKfWOPr/y5avypxBuhnEfrk+J77JIgV7z45dB3jDe/humciZR
	vLq5Ai/Ji6GoJ8uY9DnZMKjMeV9YqFIOb8vjP6zLB93Q5J+fEslH/cx8sQw9/Sq4vlx1ZM2IbqV
	7onJmAML5FPj4pPxRw1v3
X-Received: by 2002:a17:90b:4b02:b0:366:3df3:fe45 with SMTP id 98e67ed59e1d1-367d49bbdc0mr14362008a91.19.1778590530033;
        Tue, 12 May 2026 05:55:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4b02:b0:366:3df3:fe45 with SMTP id 98e67ed59e1d1-367d49bbdc0mr14361981a91.19.1778590529512;
        Tue, 12 May 2026 05:55:29 -0700 (PDT)
Received: from [192.168.1.102] ([120.56.206.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d64de478sm11080286a91.13.2026.05.12.05.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:55:29 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        hongxing.zhu@nxp.com, l.stach@pengutronix.de,
        Sherry Sun <sherry.sun@nxp.com>
Cc: imx@lists.linux.dev, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260422093549.407022-1-sherry.sun@nxp.com>
References: <20260422093549.407022-1-sherry.sun@nxp.com>
Subject: Re: (subset) [PATCH V14 00/12] pci-imx6: Add support for parsing
 the reset property in new Root Port binding
Message-Id: <177859052375.25787.11297345759999790209.b4-ty@b4>
Date: Tue, 12 May 2026 18:25:23 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzMyBTYWx0ZWRfX3kAl7d6L/B0N
 rsTL4WlPS0pWC4tINklAjmgjWuzAeQNK6rdyQgNBBhb+gsUD2lnlXybEEIp9CH/YirBcQiThQII
 cFzONEU9ev9z4vBNFxANK7xSKHb5O0Bzxn0l5at5Lvki64CzM/uu7l2GZzo9DUygl1EwDtJqKzH
 jI9kPTqt36uvUTHjSaAPYX2Yr9JGeNTfsHscGZqmax2KIYOjJ+TuhMq6abU0UaC7ptQ6EXy+8pb
 RCnPnTT+oIHTwid6xN04UWeg/iJxGqmM/MfIHaRG8nIIMDWSkzNx2GoBUbwKjUEry1+Se9xPkgX
 3y7mBL9173q2DVNX2An5fLGxVKP2c8fZbeUD06Ng2MHonqciTxN9JI0Ymx+wHdnj3fPsWNxzzCB
 JOfgknGoNIsMoT9Pz8t8XBOvYgHRk2kTVkx2An5svYZDzgxuy7DiCZTG9U9ufjLuT+u3ng9tgma
 KCOgfF0CuPugeUyPquA==
X-Proofpoint-GUID: UKK2PGXBnmGYPDu3BYHXn8A9zNF65xNg
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a032343 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=QuRtzvr4xB5J0le8HPcEzQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=VUCeidzB4OgQmi4dmx4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: UKK2PGXBnmGYPDu3BYHXn8A9zNF65xNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120133


On Wed, 22 Apr 2026 17:35:37 +0800, Sherry Sun wrote:
> This patch set adds support for parsing the reset property in new Root Port
> binding in pci-imx6 driver, similar to the implementation in the qcom pcie
> driver[1].
> 
> Also introduce generic helper functions to parse Root Port device tree
> nodes and extract common properties like reset GPIOs. This allows multiple
> PCI host controller drivers to share the same parsing logic.
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: PCI: fsl,imx6q-pcie: Add reset GPIO in Root Port node
        commit: 556c5f7aa06d3e8119d35f40b6602d3a547cef9e
[02/12] PCI: host-generic: Add common helpers for parsing Root Port properties
        commit: 6cfd1e2fae1bbaa9258794ba9f3128afb752245c
[03/12] PCI: imx6: Assert PERST# before enabling regulators
        commit: 97eacf72d1754eeff8624114074929606fc3f2bb
[04/12] PCI: imx6: Add support for parsing the reset property in new Root Port binding
        commit: 40b7f61a1a4d7fd18188f3f87e15ff5a90ce1d31

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

