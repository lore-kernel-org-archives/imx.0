Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A72B2D4B40
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 10:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771237972; cv=none; b=I16V3T4PVDUVReFK0cO0ki747sNlylfxTtGLv2L1AEOY6p9aDbMSXVzEofOnJZrPWVvpG/GXmSjug6oQ34TB5pvlyGGeS1oAx5uc1sYGjjQDuYOzEQ5xcyhCUX/9uZWtrz+jS0EHnMj6+8gqB2++QfnU2I57iIt2//8vgZaQ7Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771237972; c=relaxed/simple;
	bh=slHLX6ermrbEdMU7Mb1n04AGY3NbFRMTGUVipYQQrFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TW1/UVC0Y+vcpQDMhCV2s4GyliSFvXhZu9eA/NYKvZXP+WTg0w0/4USj670nGSliKoD9MR7VMVu+rGtVEZpe92uBAFv1JXO1XZSaXah5N1NsgIci2L25ShvfBxGWtV6hx0W0CvZWBaYGMnri1Oe2xc6W8H8WaiIMwj9o9hajqr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVYKLm9e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ef9SRQbX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVYKLm9e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ef9SRQbX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FNPC9L3659155
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 10:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ldz6g6SovUoukXhKXBWKpNMY3TWItCGCHJsYS0M0OHo=; b=fVYKLm9e9AFd3YZF
	VC+Meh0tnjSUM3KUbTciYtCtohTsVrxtGzqlmr1I7d4Nz6xbzMyBoWAJlJ5YPe24
	mDGj0jS8tRXdQMDcZ8v3KYp22wTvAC8LQaZLQcYJiCTqsoKFpTMycD+wGGKtcAGS
	ENLTMXo+bWa2tSayF7TNHOX9OFf2iei15VTHTf+sk0404M7kS4mmfJP5K7eZ+diA
	3VlzgDeO9hjoJQ4Qke195hm0KPv98Mmrtm4Wqtqy8F65sRSreLmSQ+gXiuos00jh
	8MSFf3nUER9e/VK0K6x3QaQVOTIz4f+OrMedlzf6CdNVsbFqlZdMHcLk3WmHb5By
	bAlmHw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cag24c9vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 10:32:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8950562d351so460839146d6.3
        for <imx@lists.linux.dev>; Mon, 16 Feb 2026 02:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771237969; x=1771842769; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ldz6g6SovUoukXhKXBWKpNMY3TWItCGCHJsYS0M0OHo=;
        b=Ef9SRQbXjdX0J4VAOxnThimuNe3SWnCEfiiXHBw+q1gt/4djYOcBpPFeKmVXnGhSUG
         23rRxQ0W3hyxshg/LRc/OU8nZE9aSSf0hyRB6rKkS/o3i46pGPDMyLdmdlYO2jw8mJms
         Iw2NRHe7WOqCceh0DPwD4PdV4Lbf2h7aH0ziLNzcY5Bz7z5sgDXAZa7nndUZQ7Vf+5ZK
         oMex5JP/q0LxnqTrqd3IGA4guCk96gtUp/W7FHFporYuiTLJkC4UCfI929Gw6iTO8vz0
         ctyqdlgFcZHLbHFNfXgTFD5iNrs7aiOuA+PwZRcjVKiGhQLvTvr2wU4ddA/jVQOcUU7c
         idQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771237969; x=1771842769;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ldz6g6SovUoukXhKXBWKpNMY3TWItCGCHJsYS0M0OHo=;
        b=M0DFjF6HCV6/w6ptQNpPaIolmyY8oBs1rem9TWpSG2/geGKevaw3z7ugLEtCIBlTIs
         UP4qTc4x9wqTiFGWk23ZUeoWB23snF0ujpXKAGxXwdEXdGBrHJ9IQUnU/sYhD6HPO0ue
         OKmaDFPlsjmo6p/eKql8PJaIQnkWfwZFcXTFiQrKfwksxSoBPI/7K4TLVJ0iZAsFc3NQ
         valGP3yI7luyJwqJ+tQi3j2dPOcwGjawBLTN4Y63PtHow0ijSEtfMI2zBrvhCm9yEbmt
         367BypAuB2n1tExxJJSEbtrdWJ7/0y/v4Rr1BAvd0+LpC7hDhN0WqHuwXI88oWEevlWV
         9a6A==
X-Forwarded-Encrypted: i=1; AJvYcCXNgjKgyYF18EgeBaiPELhW7K0ph3gAWpy3l+MmMu8hF0v40ErcudPOWlo1ElKNnkDAXhU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyucJG1RLmclnklmOGCZ6+kba8Bg8WB9PnRZtjhH99FZjZjWgyT
	mPwUeWSMGaE069ubkqMVGGNX4Kv9gX/I8ndzTBEvzJE80Er7T4Uun6/PaXwwv/AaDgq6JRA9U2Y
	JCWCGwvWYq6hLC8NB4Q1plzh6uPTzKP2mqkgXC71N5u6tHCOOEgNbVhQ=
X-Gm-Gg: AZuq6aJ0YZB8kBAv/5Muj72pD5msK0weGMVLtSL8lplm1cnqVcR7KaLXuPu+QmIIpwc
	Wqb6xgeHql1k3ySLL4geDeS/rFo0zyNYf2BUsSPGUAazyC8C9LiC9ONoAV5xLnCKBCwjP/Ync1K
	D1wPXcWur8TqR2zp8oo4/69IUL+hljjgL06THAjlOoNEfitbtAAXIfx7+3cw+CxcLw4XsMmpM24
	KwonGZDeKAfUOougIWoWA+F4j+j3NWlFKG6UwYfXaFo82kVlovzRkukilvzfdqbFGR7Z1tgVNFu
	wfJFhDjtswmGeTK4R132hNPkqEG4HIkSCVjGVkrtMRD0CBq2hjf+zEYJwwSCCmnf1yp/m5W3Jd1
	Hmr5vxuwuVeU/Vqdpxoh3eRjqQAJ6mE0nna0e
X-Received: by 2002:a05:620a:4727:b0:8c6:a034:9226 with SMTP id af79cd13be357-8cb4c018c52mr990684785a.82.1771237969485;
        Mon, 16 Feb 2026 02:32:49 -0800 (PST)
X-Received: by 2002:a05:620a:4727:b0:8c6:a034:9226 with SMTP id af79cd13be357-8cb4c018c52mr990682785a.82.1771237968932;
        Mon, 16 Feb 2026 02:32:48 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac82f7sm28469525f8f.28.2026.02.16.02.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 02:32:48 -0800 (PST)
Date: Mon, 16 Feb 2026 12:32:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: =?utf-8?Q?=C5=81ukasz?= Majewski <lukma@nabladev.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/4] clk: vf610: Add clocks to support MTIP L2 switch
Message-ID: <jk6roonftm44qwnyxezhukdoqahrj2l7zaa55w35oq3uj4en4w@obfufdazx3wb>
References: <20260129095442.1646748-1-lukma@nabladev.com>
 <aYAEM8pcuumly+hc@shlinux89>
 <20260216101538.0aeae484@wsk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260216101538.0aeae484@wsk>
X-Proofpoint-GUID: H0oNjlfVQV8b2x5JCGXfXZvXRI_0TJ9w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA4OSBTYWx0ZWRfX69DetKwWgCrY
 5cy2H8KNPtdK6JL6ebuXkFItClbSnggSRqX2mm71vKiS6Oo0Sb1BwJFDjjPnuq1fD3cSkE/D9aT
 IWa6kGjwdb+NLSoZuqLmh/QOoaMl4MA4gZX1G2JHCfIW6q0hkxEJ0wn/X3RtowBisOway0vnPHo
 0r0zvq9F4YrcYIKNQEWeYq6ssPfBVGm+mCdUY0i9/Q42gJnXVYZIP7DBz8NYbJ0n7fYTPhOSjmM
 TX2GIZMbrUbJlgLBkGrB5M4XuxIIngHj5frFg4B8WQsYafPcCswLkEoQSI8Dg6Zg3O1cUJx3gm1
 QL1PrbsowOe3npLWPOgVidsNkqMC6BOkl/KY9AStYxHYRcfqdhkaFsow1njlM+P2QlRox836Whe
 4qbPGrCTsMPHrz+XUsmzsa7pZOiqful/5ki9IruxhOOGqhiVY1f9wsX/P5jnT4HRFKdUsO51PdG
 KuWywFGA/1C4fwqIwAQ==
X-Proofpoint-ORIG-GUID: H0oNjlfVQV8b2x5JCGXfXZvXRI_0TJ9w
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=6992f252 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=8AirrxEcAAAA:8 a=f3gpwmEmWHM1I7Tw-EcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160089

On 26-02-16 10:15:38, Łukasz Majewski wrote:
> Dear all,
> 
> > On Thu, Jan 29, 2026 at 10:54:38AM +0100, Lukasz Majewski wrote:
> > >This patch series:
> > >- cleans up clocks' setup on vf610 by moving VF610_CLK_END define
> > >  to driver code
> > >- introduces support for several clocks required by MTIP switch IP
> > >block
> > >
> > >Lukasz Majewski (4):
> > >  clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
> > >  dt-bindings: clock: vf610: Drop VF610_CLK_END define
> > >  dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
> > >  clk: vf610: Add support for the Ethernet switch clocks  
> > 
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> 
> Gentle ping regarding this patch set...

Will apply after rc1.
