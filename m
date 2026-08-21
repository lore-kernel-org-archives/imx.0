Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C68448EBC5
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 11:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313011; cv=none; b=sIS8H3+B9PGJygHSjlUQt30WeRLpFGXdLkT/m/ex2RaC1uMPv0O5rHH8zZ22cz2cNRjAfu8XpaAbhp3Hl5VySaB8BduYMnPovvMYeC8+PtmA5fHMR5V40VHhQPtSYcsr9O7UGJE9oLNX+adSEtSijdrymTYbA4TSiGfCVt0xoVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313011; c=relaxed/simple;
	bh=SrJH4dZB8WJPnAhdN1PMsEGA/ttbP7wUt/fEKp83GOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMmBi3nwbW2oNVnsNAZGRcoWsRoIhvVe7WDjQis0MlNwudSE8K7+Qm9XovkqDaK6sicuhjuymq6kPqzGyqhQSyvDVB7CxwWQAw1KpKwKMzdeoFj+PfX03a2g4AylTvVfvJTuWXojDMyLkTXdPooOvWn+o4nKizLtj3ICCLZ8MbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j8PHXZ8G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bm/I1D53; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j8PHXZ8G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bm/I1D53"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LitV1983072
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 11:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nJAl5S1NBzbKBpbUUBk1SfID
	XbwF4A95DTodMVYzqaM=; b=j8PHXZ8GBdDkM3IDRboI7LKBPbbzwqxs4KnQlMYT
	1Ad8/AXHODvZku6Go6tyiPvS090dopICCRXKcRVyWKRSulcFk2B8bnlWJa1B+2mS
	ZAiqr/wWUdHPcPYq1B0n1RsGpBBya5BcZJzTyUqp1dvHmpgOu6ZaAapBflWA8gDD
	ijP7c6uioQp580tCaWvWUTzTsG59L/X73X+9lrrBiO0z1SRa0LF1Xi94AMHTLn1T
	8wzw9OC41hLtIPwstukmNKdy7mUSiGKZWrYjAbtIAgTvbo/5ggz1dKLLdVUlgl4X
	oIieT8JcD+PvsX9GubSsFg0luJc7pCld50Spzd0X9c+VwA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdsj3xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 11:50:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73858d44c8aso207355137.0
        for <imx@lists.linux.dev>; Fri, 21 Aug 2026 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787313004; x=1787917804; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nJAl5S1NBzbKBpbUUBk1SfIDXbwF4A95DTodMVYzqaM=;
        b=bm/I1D53/Asin2grFnAcFjL+UFCjM/8e/mutZdYUau36EHhBhL1lxOMd7hk9T2Bha8
         PXqpLWsweH38HVotPPdRwTrUi1w22XRsIY5Tg1h6Sk7o1CON+GK/MIxWjT8KadDiw0D9
         kVw0DKkXA3YXuu4JwCkau+ceBokoyC9mnaCOY+TesSAkMf3VCNgq0lBkE5HIUHsotMVv
         UztkfGPPIbhG9Lk5OZtKRWz5LvXjePtcKyeHrzR7I6aO66Jdvtdgr3WldsG+RLkv0ZYs
         iOx2Zz4mSrc7XwrNTDxXPAYSO2Jo5gKXqvJFv9ZUo0+B83MFO8jsJPGVwWahQpUlPNDK
         wl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787313004; x=1787917804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJAl5S1NBzbKBpbUUBk1SfIDXbwF4A95DTodMVYzqaM=;
        b=GHyrVU3L/lkpa+TmoxSUzGJceynPDD9b3kAwG2WLfSlPW4RmoVnOr8//KkSXm/Y4vL
         uaC4tA9lHRVCiCV3bnO43lRmRB5pJzLj3RaP6j0s1Eq02AIyrV/Pn5LMyHbdex3zn4VE
         ej4xXpZMwSrjy2S3wM0cZtg0H5gd3KbnFZ2AvCQbvVSRJ28+GTPzbAD5x5UFDca4+Rpq
         sj3ma4LVe5sQlu6s3N47lR6pPxlx31AgWkMPUdg3FXpmExx4ELqw45ozJZmOV/P4Sc8/
         YLto7xPsjmC5bVnZlT4klt6xTvA3vD4JSli7EE9a7HgfhSvfZVXkykNP5BmSKK7mPfWf
         ZEYg==
X-Forwarded-Encrypted: i=1; AHgh+RrWdSLfFfITlflzTILsE1UyGC9Pn26qB9gGdo8+z6ApOt0Hhhg48yvRXOcvsYwuGmZMbsA=@lists.linux.dev
X-Gm-Message-State: AFuF++m22upvuOV2CgQpen6NcfkI9Ot5LetXRkKi0yMp6TC/rIIE0JYR
	gprF+pY8HFf6iQ6NWc50mDmLv9KXrEcYqK9zMNR2BJPa9okHgciATE2uAcaYtV4mDMgVkokhAd6
	Sz2krfTv0TgcaD7z7nfruqz0vzN6S7epgS5MUgvIGASBVpDIOSjTtH8E=
X-Gm-Gg: AR+sD10yGbUN/RkmZnYGw2JSILiBlXGfnVc74DqxI6mgJM/Y/utCoGi9gInoIrhwEpk
	Oywnt0Ql0gLVLu582C2ocMHr2oA3J6Ag/wpTMdgz3EeQ5siTfe+/mCOd0UrbgMqa1Q2Pw85tNGm
	o0p1wMy+6r7Lw6EzwWZm25wLDH6T8KwueuGWb/mWncZ/5rbzRduqKjq04aImlu3ZoTbeYqYIZ2g
	CtoD85HJaPPnyG2jFhp8Rgdvhw8B7QRIdEZ8uR1HKkQa7kTXs5HmLEF26omWvbwed1Yy5OFs7/7
	U1K73paS824zp4A43jDfezRd8xU1PGr4mme19mzXQB4NTK3ZL9I/13EP+H2buYzj0kQ3NAL4rFh
	IUZ9R4JEQbtfjP1w=
X-Received: by 2002:a05:6102:2c15:b0:777:4f1c:15d with SMTP id ada2fe7eead31-77a64d6bd7cmr1880887137.14.1787313004248;
        Fri, 21 Aug 2026 04:50:04 -0700 (PDT)
X-Received: by 2002:a05:6102:2c15:b0:777:4f1c:15d with SMTP id ada2fe7eead31-77a64d6bd7cmr1880848137.14.1787313003628;
        Fri, 21 Aug 2026 04:50:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff158e82sm5959426a12.16.2026.08.21.04.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:50:01 -0700 (PDT)
Date: Fri, 21 Aug 2026 14:49:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
        Brian Masney <bmasney@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: composite-93: return timeout from gate enable
Message-ID: <vfm4yvruim675ev4s6jj2bkyg7zjoifpbdsk5ipvrvpoqvr7yy@c5voyam4vceh>
References: <20260821085616.1129333-1-gonglinkai@kylinos.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821085616.1129333-1-gonglinkai@kylinos.cn>
X-Proofpoint-ORIG-GUID: 3fwwSlTV3u1qM42MJe3z-Z7VvE2hw_y8
X-Proofpoint-GUID: 3fwwSlTV3u1qM42MJe3z-Z7VvE2hw_y8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfX7xjsGEykVOb/
 m1kBvzakW81QMy9vVckS8lskYWI+BU5fvwK/tv1er3MmpSsIO/vQtIQDHUeYMQQpahFvvLB5bK9
 kN77ixTVE4BS7wnkw5UN8ZvkmJUObR0=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a883b6d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NhMZVuV82ezdd5x-88UA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfX3X2IJXKQ9PRF
 xdV/L8TIW/ec59r7PSLxq17CAJfVgqzztAH+SnbirGCLhcU+T/AcRmlJNgLr06eCsZmJl4SnuOm
 3gjVQ/cSGmbMpertvdY89vKABgFTCVyhnr4UL1ngPq6KGY2l0mJPS7yTrm3D2eujm+SROa4jluN
 paIJhR4b4pEcffxQBN6Yhnr3Cmh1hsyLsaLcmEk/r3U9Fp2W1UZ9qc8x2ekpig95rLP2LOYf7qQ
 tS6rUwR5Rxa5gaxnpRuatUxeede/bsr4fFD18/18W8C+R3cUMtaEvgnb+c9l7FT642F5cucqghy
 W5nnOEgV9IFfLujJ33g0gm+P1FR6aqnr4PLGsRreYfihxWr6T1I/tF+INJTaZKYKG3rNB1Vo/1Q
 bnT/fWQ92C0/9nB7Stu08/uOlyCuGra890fcYKe/Xfh3QyloYuD+7aGI69dx5yPvFfhiuzfMalC
 EfIOYGAHANor7A9VdKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210089

On 26-08-21 16:56:16, Linkai Gong wrote:
> imx93_clk_composite_gate_enable() always returns 0, even when
> imx93_clk_composite_wait_ready() times out.
> 

Ok, so you are describing what it does, not why you are doing it.

Please make the commit message a bit more clear about why this change is
needed.
