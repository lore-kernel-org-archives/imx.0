Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA2A1E1DFC
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525508; cv=none; b=UDoK3ySiydfiqFVZ7XaWFTa6ZCziwdc8CJlVfINWXcVWMUls9IMmt7mkrhuXOH1stKPsNAqnpxC5NNm495X0agfIBllcq1kiE+IjSmub056wi3dplTuoYunEDuAX2XtHJ46agtb9jwnnoRiDJ1Ri78fFFPuhT547j+ipsU5fsCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525508; c=relaxed/simple;
	bh=U+38FF6aEMgZeOpbDPv4WqDn8gpMxTsQuXNhCUp6Utc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsHe8iQBcsVlgyabudrTi2ZQGepD8ubAPfsQxxWJNAJK13RZdhWJYxgz7vEszxq72lTV2WDzuH1yjGv+5ZHvXYBL8q/12evbmk6WRelnALAIuvxCbvXJvqXJt2ilMK9POdxUkxXblk7NI8VRS3y8RXnrr36/knI1fHpGz24DCU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCuADkyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gr8ryFTg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCuADkyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gr8ryFTg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAcNts700191
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 14:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3f3IK4MOfniqkAkGkyLgogaC
	73+XOhuDYsdZ5+Cky8Y=; b=CCuADkywl5ikDoVanG3M8TUuNGVNchLUXloIYwfX
	8G7bksXhVJINjzlccOaFPD6CfVWs6cyCMI8g5jQKvuz121Uz8m9kO3+t4zaXegiU
	/deium0poeRt8W0VejetG+rqXN1iXIdfx5GfqCVN1hlL26Fce7mKN9A7bPlCDqeD
	1+J4cvzP67Up07z8gzxuWYRIyfK74FttEwr6A5LxbMT3ZzD9vwbVN6lDOG9PE4M8
	pUA9k56BLLi9e6cO5uUpgFthUAWBbnACY0DZRanCyTDe+6z2O3yCe0ixaoQssYzE
	z9vG52EFSqz0LEidz1fl9d398avCkvjYILjil70PzoEOew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3u67d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 14:51:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52fd47227so1025858285a.2
        for <imx@lists.linux.dev>; Tue, 27 Jan 2026 06:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769525506; x=1770130306; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3f3IK4MOfniqkAkGkyLgogaC73+XOhuDYsdZ5+Cky8Y=;
        b=gr8ryFTg9LZzmKepPuN0X13uNKtzUMkuXCMs9VqLu5ZQ+TTUNdq3I4PhgPOPnTYMxP
         ED2LsnWf4tSnUoSQ/x2dMhTF9nv2v7TV/qD9C3b5kkIFnGBaLORw7k3xZRKCojqMq8lM
         dMoy0GFR0eJ0N65pDnKa3egrFFuxUIm+juWuuCyMtZKRTT+Nh7hk/m1YECIIsAt+K/df
         85ZPuJnas1Ga64zBzjrpLHBM/IynRxRlqJTyN2qg8maesmEGeNDnfSZQwShI8UtXDHh/
         +jztW2E99wqiG9rthts74NbmbuzpF6FdTNeS1O76T1dJAr0Zt1oALgc28ZSrcAaQsete
         7Jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769525506; x=1770130306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3f3IK4MOfniqkAkGkyLgogaC73+XOhuDYsdZ5+Cky8Y=;
        b=bZme+aXpOae+jSE392amUGBM6dywV/irvAll6jZ30ZpU8CjVc+NHncJqKuGuii8a2s
         bVtmpHjvCPbNUEJtMfazJrkSlTG8Ugx/usEZg+vl/AzRVm5bcj6W+MvAUTFr8sk3dWsq
         bPcmgSqipUiXWdpHSDJTnE2voiP3Vn5JV2X5jixjOKdcgQOlZy5V5k3UOUH6W6pp7yRG
         q3Mc8HPnL+U0m8ofxv/h1PzFAPeHwRf8F41xquK7CjA5gqGS7JFAkyOiGl6mkVFKXDJj
         a4aZQ5vNbUHcws/Fmpz3koc86Zvm3h2RiDhD2ooi0UFJJZoFgd6iLwEkl+c00kJUcs+X
         PSWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw1enaEvh0vif97LIqY4Nl4S8cZu+oVZVUnxRmPwf5f5tuVa3tSwaIBeAIXHLLWl6CYxo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFnWYV8txI8cMO7dcDke+wd3Ma99d8VTQKdBQoLlUBFwpRhTCG
	twR3su0Odr67SEOMZmf4/eCllWkw3us2Ly9nsr3wyE3LwWESHOGdUhsUXInSECmakZwNKGmFsHa
	y60BNfREcVdQzGRXB55qkPKRytV7Hp5/VwE10yf0fut25ULN+/mbsacg=
X-Gm-Gg: AZuq6aLTL3QzBu1GqEyTPkWQz33TLjlTDRnaFAikNV0+Aj8LTEo8VcvUu3RD2kB8Q6A
	1RN/im6e7WeFHBm+0YaILpaMevFSSDkaCFmXqd7ZVYj2T+GnyGpujZlQkEhfiSbQuAzqHKRQopG
	rZzFmU1JmcdclXgfPGjl1FzpscCAFQDNcTddBmfP9VNpwHKiWFOf5RsBPvKV8e5gWLGHthTR9No
	EARvtqTJtp/TR+JWqEobTFuobHw32MrZamWJLPgweg4yXDrcj2glPUJYdg/jrfHVuXEQwKtNv9d
	LXdZDfWkPg9b9L0j9TQkNBnP8mCUTwLNmnsT19cnrdic9xqTsCLDWUDC6cISNh17Er7c9xFZxyW
	U9XHEqFirA5IoofA6lhVYSPxR
X-Received: by 2002:a05:620a:46a9:b0:8c5:390b:6eb4 with SMTP id af79cd13be357-8c70b8e5f84mr208881685a.42.1769525505637;
        Tue, 27 Jan 2026 06:51:45 -0800 (PST)
X-Received: by 2002:a05:620a:46a9:b0:8c5:390b:6eb4 with SMTP id af79cd13be357-8c70b8e5f84mr208876685a.42.1769525505004;
        Tue, 27 Jan 2026 06:51:45 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d61f1f8sm133530425e9.5.2026.01.27.06.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:51:44 -0800 (PST)
Date: Tue, 27 Jan 2026 16:51:42 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add optional
 clock enet[1]_ref_pad
Message-ID: <b3bv7uevrk7c2argbhyxohhbcn6xtxvrj5fa4jwjdp5ymtinza@k57crjsa4yn2>
References: <20251106-ccm_dts-v2-0-12fa4c51fde7@nxp.com>
 <20251106-ccm_dts-v2-1-12fa4c51fde7@nxp.com>
 <aVwV8/rg2h2x4OwN@lizhi-Precision-Tower-5810>
 <uilxikzky53j7sg2barmsu6fkco2fiwgak3fh6eqc65iggmbge@7oogboikthae>
 <PAXPR04MB84593733B9B971529DB368F58893A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84593733B9B971529DB368F58893A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-Proofpoint-ORIG-GUID: yAzH-R7f2IAk6LNB9HeCnzMwnHaoFv0d
X-Proofpoint-GUID: yAzH-R7f2IAk6LNB9HeCnzMwnHaoFv0d
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=6978d102 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=XYAwZIGsAAAA:8
 a=uB1rFwlgQs9gonznhjAA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=ST-jHhOKWsTCqRlWije3:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMSBTYWx0ZWRfX0NLArO1xlFkw
 QWPVLph3lcJpaVmtjbc23b4V82biGGF3KJ5VdxPrl/hMCCHOexIXZtooy7dRCL+Yw8Fz5QdsTMP
 Kxg+BaRapB5EFP1om184fBX5kQ0UUtoj3vyTjb0zLelTVV2c+Y4YnD17br6Q/lMYWBWxtmN9mHn
 dq0pYU6yjJ/aAndkZo0AwusRR12X6V5eHHMOhAIwv4Lkrg3TVG6PDBBWBv60DZWDkcLK1g+BbsP
 a5NbAkPUbm9ORcOpNfS+/vvBnhP5Raip1SQUROvwtdeyGHGpLNPJIN2qnrLpLe7PHif3XQo+Fjd
 auujbVRbMk74wBkg0yQdtX9MfPmTXHbwZiSyW1epr2A6doVInyo9Vrzhss335QPPKey3YsB4nH/
 BQDe28aK7TpSwy+bAsBA7edg8o3NoDd1hMqkZvYOg8dlStv6hGk32V6WTfwtDBl0t9IiefmqgKv
 cy7U9uY/kMrfJe2j7KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270121

On 26-01-26 23:31:12, Peng Fan wrote:
> Hi Abel,
> 
> > Subject: Re: [PATCH v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add
> > optional clock enet[1]_ref_pad
> > 
> > On 26-01-05 14:50:11, Frank Li wrote:
> > > On Thu, Nov 06, 2025 at 02:57:21PM -0500, Frank Li wrote:
> > > > Add optional clock source enet_ref_pad for imx6q, enet1_ref_pad
> > for
> > > > imx6ul, which input from ENET ref pad.
> > > >
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > >
> > > Who will pick this patch? Abel or rob?
> > >
> > > Frank
> > 
> > Missed this one. Sorry.
> 
> Just see that there is V3
> https://lore.kernel.org/imx/20260121-ccm_dts-v3-1-820ce9b5fa38@nxp.com/

b4 will pick the last version automatically.

Thanks.
