Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1BC3D5C2C
	for <imx@lists.linux.dev>; Fri,  9 Oct 2026 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533772; cv=none; b=YJD1/Tym3suB1B9/KnLuTR7kuT3OOHqI3IQr8Y7o+Jy2GATi44pdMsSVa1ywA9InMkCm6Gkq2Qq9W3PGZ57v8HbhD2ZpF6h02yr88l/ha9YKNeSE5Q5kHA9gNUmPVZe4+Za+Jcgsf7Rr3y2J9Ma3yTgXK3uXxP1bm8a3eVkCWWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533772; c=relaxed/simple;
	bh=t7qRmqHdMAl1qk4MJVpTg0mh8/vY1dTo8qJcR8916Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f46Yr1Rmq//vniESkzavLV2j7e01FTN0MZNvhpsY0KNtJPwCmqcRPXRHJHgOhXlQTc8adz9knKBlpuTJwIamFnPfPsuCCbETxpRv4s3voQlQdk8deBcj6D9XAV3Yq90kvUrTmT5EgeTG6oZOC0yzgWv4w89e1V9k3RDqoYnUzEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fp/K5liQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFqSN1Td; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fp/K5liQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFqSN1Td"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HJLW564686
	for <imx@lists.linux.dev>; Fri, 9 Oct 2026 08:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T4fGb7Hz2boMwAT6WGpk0OCK8tzz+FcRa4JXQhQJpJk=; b=Fp/K5liQZd0BPbPo
	6C8FYm6+sKesgHm5jfJqOTCdAVQ8fmBZiCmOHKbt03g5iWpY6jVRjMGpdqczBh+x
	EGi2/VnvoVuAjx/e+EdGKmMrhrUXLhCWh1fBCfGwqEplnnDBMZOD/vqL0ygyM7t4
	/C3vlTRsN7F80iAT8QoXSGCAgRST5zWa/l9xaNGwMReTiEXTnUOeLwUAcmID9nBF
	paC6xLZuPglh9Q+A9Vj+u8j7Xs2S7f3uNrV6bl5SUl6d82UJC/Dw11vBM3ojVPfz
	izx6rMQo5dVHZSBLnz6tpMNHDavOr+cbzcgpDuaGXMja/Fn4EMSZ9A1jpnCeRhJr
	4XIAog==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkahx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 09 Oct 2026 08:16:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bf4c0af4eso375321685a.1
        for <imx@lists.linux.dev>; Fri, 09 Oct 2026 01:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533768; x=1792138568; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T4fGb7Hz2boMwAT6WGpk0OCK8tzz+FcRa4JXQhQJpJk=;
        b=MFqSN1TdU/rSG+fn8hXxrYBP1D+UODDWRMijf+qO0tY4W7VlUnBxOBwgAJ9WuReaEk
         QAByl5IINKX8ILjI74CCCRu3u/Gb6u+AwFMGzGRQoYbnUgVgod5p2xqgV9oHll8EupJN
         ivlzqQnykqqGSOh8/kqGU1BBn9ODBidY2XxqaU6I9GcPB2wU57IpxfU2nGXO6xMQB7UU
         +RrQboO4icI48Wbd2fpq/8EOGA/hzjO9aJheesO7oSXaEMrDaneNbbsDwac/ka+mq7kl
         St1MuOwh4sGxrXQ/18drrENgK1kcNb2pq4y9JftHUIvJvli7kC18X48Op0HYSnMvWnDz
         9TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533768; x=1792138568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4fGb7Hz2boMwAT6WGpk0OCK8tzz+FcRa4JXQhQJpJk=;
        b=MKGkX09Pok56usfAn/UuLmcBElDyIOAq4iEgAmzWa3/6qLnersUPygz1AuKJIAIc0K
         bTfktRbAr76I/0LqOsu7rNO0+UQffaKyc5T9EEtQUuhj8HWkL9Pj0yoCbpYvHA/g01QN
         Juy/x8vIy4fW/+Q7gGchQ1wK///CAxQdH/uu6z+asfv52CO6/iwmt22vsWmaGRAildBf
         OD2HOqFDj6UoO40si5999ayigql/rnQ6lgyj9+YPlOfw0KUxGEZiHWMGMq5jsaairRqP
         SFMZAbTkp6sqZaIKdowbMOTq1m5RdU6RXjwMgezR+W8or9QrBLHqsm1vFjukLMaCHhRR
         hpEw==
X-Forwarded-Encrypted: i=1; AKwUvBzwOxlA/t/geTKrqq3MBu4Dw2BTifPiwRHoUEw9leIGTHu4t/zIb5QJAEfmt677u4qngls=@lists.linux.dev
X-Gm-Message-State: AFuF++n2bfnWCdPvprj5OPg36z2h14izG4g8ILAHgxPoYar88M80qYP7
	j4Wx7yqfyKHvbzhykgW5qiv7eOo8rk5L9r4/iTKcy5sFRgXAZElaS9aXB1CRwZdYfcnU7gGESDK
	KGmfl9nX+NLz1UXIg8t8URMB627vQoG+JuaG4tkPeWDkkksyLG0hzudOWLYvFEbk=
X-Gm-Gg: AYBFou0IjpSxA3WMRHEUCLWn1ZNNKVnaaDpV3lrs9gCun5b1avjMkZiFXUk4TLEhlyR
	8STjXt/GaK0IpNg1VBr9qOBNotIcZwtr+EG+LjRQmizylwibEN5pHRIPSFYHypWQe5Xd9iv9vjh
	XtFAC5aSNs0TIeyKkHqUVkC9ew0qZoe5KmbXSsheiZuW5K2ozc07iFDuECz3IxUpsZxQnTrYWh3
	3m/1tX+jW78FnaDdsWZPIpgtZdEXARXLACiuYAdGwNMqtZes0aUWtALW1sfm38HIE5mYDlkd0CG
	zVV3a8y4RQkyWB/qfLo5dy2Y/o2dLhu7tVVvnR4/Ktcvm856eLDuOfwrfhj1fzSh/OTqN1hnWXZ
	w+zN1UsHBjsZolxc2Px8d6LtTplE=
X-Received: by 2002:a05:620a:2b88:b0:93e:4f45:6fc with SMTP id af79cd13be357-93eb965e53amr213374585a.27.1791533767696;
        Fri, 09 Oct 2026 01:16:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2b88:b0:93e:4f45:6fc with SMTP id af79cd13be357-93eb965e53amr213371585a.27.1791533767082;
        Fri, 09 Oct 2026 01:16:07 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm69068565e9.8.2026.10.09.01.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:16:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frieder Schrempf <frieder@fris.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
Subject: Re: [PATCH 1/2] clk: imx: fracn-gppll: Add 350 MHz support
Date: Fri,  9 Oct 2026 11:15:59 +0300
Message-ID: <179153373231.1996373.14178239298073465630.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260910-upstreaming-v7-3-imx93-displayline-v1-1-bb9446e6ed6e@kontron.de>
References: <20260910-upstreaming-v7-3-imx93-displayline-v1-1-bb9446e6ed6e@kontron.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dWzQtpRDbDK6iNL6nuD7IDzG4WC1EspE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX6co6ffzMlav4
 3YdjRawWb79SGlIhzufffo1kDh9gESZ3HqLrVMw/PP7iX/7tawEbrr2135fDC/ggYJT8I9WWEei
 CovA1yuxJKOaOHOwEQYcEbe/CrzL7IE=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8a2c8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SBSG_3fblaHcu9w4dFsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX+9vD4cx/uNXy
 rMPJCvYWr1bFa6h/4O3H1cjXfO6ocBTDoEnFDPW7bSRF1I9+85gbDLn2AXs3kDoeG9oIAwCICfh
 j2buVoF3BnHSgUpMee62Z/Fv4MSv+P9oyqFyQb8/kx/ie3AyYPCrb3Qa8DC94MgJCZMzIxeq+CW
 Qo7jQYdl9DEBZNNp3pMty3x6TE8v3Hb7SI0rFsnjyBXmkPcaTa79Ry0Xrcfd6WGDzrPb7GSbX2H
 kGyGKoaghhDhZSx2KYNYCNMtMZPrRvYpTfSgP0qbrUAGWWq2s0DWaSnTrHeQSxEzTnEEodNr74g
 Dz27zW38UabF32U6d2sc1ut56sAtMNTNJq8U3T8Wu37qd7CgFKLCEK42xResxVypmMJtjIw6vaF
 YLQrlytuG6/SB6K3vJq+Emc4KWSBaJtRcjdPYflP0ylBJyB2S9Qw09eQ8omMrUfGJLStKIMrlmF
 rUPXrNttePCwEsjabrg==
X-Proofpoint-ORIG-GUID: dWzQtpRDbDK6iNL6nuD7IDzG4WC1EspE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090032


On Thu, 10 Sep 2026 17:19:06 +0200, Frieder Schrempf wrote:
> Add the 350 MHz frequency support that can be used for display with
> pixelclk of 50 MHz. The divider of 7 is important for LVDS output on
> i.MX93. It is also usable for parallel output.

Applied, thanks!

[1/2] clk: imx: fracn-gppll: Add 350 MHz support
      commit: f85b551c519ee8f92be601ccf4f7d440582ac476

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
