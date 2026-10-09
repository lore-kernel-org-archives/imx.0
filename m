Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4944034CFCF
	for <imx@lists.linux.dev>; Fri,  9 Oct 2026 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533513; cv=none; b=WlMNbAEmUHqGRkh/7Sg+x8V5JEozOPV6vm7YrUJ6cQrGPspwdDz/Ww3FYk9bCBnuzaAUv80LEjs9ZJNk7xW2tj+YWDBa4zwm5V5Q6nWRsxFUskBx/wReTn0uiNZuyWgrp7CwTjFsvtX8KP6fVF+DDGAwBOyn0FPFu6sd8KhAkBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533513; c=relaxed/simple;
	bh=6IXEn9io4jhhi35jnInkyOCmx79vnsl9EgePJUzHTRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vx4okRdiDpeBLZ9DTPEG/ndAE20sGlIkpaMRgIQ8bf32s5io1k45erVfEz3yqyQFlq92muz8+Xt0+c4dAsZtG8a/os966lHDZoHOus80G824Es+/dGfmJyO58f/4Q+gLBaf1UirxsnPDTehvP+K99+ADaC4XsiMH6WwEeUGXCLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCogJsH2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q0rpKys/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCogJsH2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q0rpKys/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HF8G3768827
	for <imx@lists.linux.dev>; Fri, 9 Oct 2026 08:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pOMaeRRKUrXuh1tFBxR1Fs/IvAupGTrOWfaFKNrQMJk=; b=GCogJsH2WLEZ3gf7
	7h9wRYz3J0SDKdw9/2oVf/epv0mHnN0QR7gWAZ+4xiK32zHjBB3fDIsQaiGpzTlj
	hNtEIx2sqaL/5PDb6vUrHZk0hB3mGystxTxXF2lBh9SUHofWUVK583xEmx9ROktI
	LS0zq+0lrcQd9EfuOigI5AmO6v97yAlHPoWWqdpLJPd4oNa7yg3a9SfX4fu5lkG4
	yUkMLSBBtVWXfwkf1XFUkl4P7nhaTxrAhF4GAHHRyMpiDldrEkbHNNEmZ2DDGZ3q
	4yAfN9RK8i++0aGltT0/klmquKWbq1zk+Pq0QU8yt3ZEQK7xUYO5IXOiUSGraUnT
	xU3lVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu2kjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 09 Oct 2026 08:11:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so1217087685a.1
        for <imx@lists.linux.dev>; Fri, 09 Oct 2026 01:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533507; x=1792138307; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pOMaeRRKUrXuh1tFBxR1Fs/IvAupGTrOWfaFKNrQMJk=;
        b=Q0rpKys/7aOwn696ZBUL1dOPxK17PKWht8zqSsjRNvT+aE4SlEXJk5DSNjEHkabRqS
         mQGb2UuAU+jHFnNsyE+PrjsG1CmgAj2i/bV17HRbuC17OOzMHJagItTjw4wQP/M9gDBv
         eTRlLXxrJ/Bffu9VdP3oUaSiDTNQs5gMWza8ZjB5XcwXRyoAqLGT6/4+vWH71K0y7hog
         GFLEFvUG9yPMD5wHUOWezSTDMt+n6BwyIqx3SJOLvN6YiOHNA/JRiNvftKHF2iBUfkIb
         i2DnLtSGV2hb5gWeHywsqn+GY+KbtpTPdVAmZ8X1MbsHvQGrfw/dvHp9w2GumVxc8E5+
         VwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533507; x=1792138307;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOMaeRRKUrXuh1tFBxR1Fs/IvAupGTrOWfaFKNrQMJk=;
        b=Ntwr2pphe1kRrTqmms3euAXhzrVbXajC2jQsaxMXN8Vnpaiehxnt88tBhhfzt/pmFg
         WwbNwX70xDCj5NQFH67XN8PB216bb9kaneepaQ2eGBIpSB6qCPfaxnlSKN4hvYsQIeTw
         Qh1Y+GbY3czzSjDiiWqtRLQBBIoWgyFK0rfJfsSLzhBq5FksXs3FFBusjozbY091Hxbv
         iGMkuVVU7MKBjwX1wR3Kr1zIJMhytESZm7nRb9nHOwcpfm56mHbTA5hhNjZn6wW1FMR3
         X+SEU1HaS5cdUCaLcYjbSb4h2kREt4bhv/8/Tc/eWLQ3bYIrBuCFe6eDTERoZRWx/iry
         wD8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzY9y0JPKo1+CkzKtzWcnBPHd7iJ1ZsUVfrm5GqL+WIxqUXc2paxsKEB9SSzZfAr+s4T3A=@lists.linux.dev
X-Gm-Message-State: AFuF++mMLxDb+QgT2OQRZbCMXiN3sQk0TXxRErxGLaEfBSMkJ0AL15mo
	HudSM3lrqqDUyeqguLjiWri2tiwLvtbJ6i6n0RFHumKdXh7+HmBXnkUPV43VMuwql4Z1Fg0rap+
	mlX7tgabolJA1+IE/pOgowhyYZ3Oy3vvMDg5i9L0kf6lnh6p0RVya5PY=
X-Gm-Gg: AYBFou3WY1haIFvtfVfUQPQQGqB/5RiXI05/xqO62s7qDK4RfVL5IM9+sWrxLqwbbq8
	nBIFq0tJ7PascT8r8AppSlCSBMbjNfu7YckxADwCj+vySJdOgZ47hTNnD6APWTiVhhtaHwKuQMO
	hiqgFK2yi7x/uCyjlaCsSyNtMmGy1gMhfcARzv33Y3hJ+j+UoCdQyJpCl+dbldpLnG0ato3RVxF
	2UvUkmGGRbTzUjCxiZfCEDmPNLTlYDHDabbTPVYZo3iAflVFDpEDyzq+VG6B3Hp312sfTMcOugE
	Zctn3rrjC9d6to5V/CO+3pDc0SdY9EnRF90YeLxrUqmiqghYKYL/h76rPzyFd32q+Y9WRwB1ril
	SS/6hxbuwYgkHCwzbPnSiD3zYC20=
X-Received: by 2002:a05:620a:4115:b0:93e:6c02:d181 with SMTP id af79cd13be357-93ebd1e23aamr162092085a.14.1791533507129;
        Fri, 09 Oct 2026 01:11:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4115:b0:93e:6c02:d181 with SMTP id af79cd13be357-93ebd1e23aamr162088785a.14.1791533506490;
        Fri, 09 Oct 2026 01:11:46 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm65404655e9.8.2026.10.09.01.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:11:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank.Li@nxp.com, Wentao Liang <vulab@iscas.ac.cn>
Cc: abelvesa@kernel.org, bmasney@redhat.com, festevam@gmail.com,
        imx@lists.linux.dev, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        peng.fan@nxp.com, s.hauer@pengutronix.de, sboyd@kernel.org,
        shawnguo@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: imx: Fix clock reference leak in imx_obtain_fixed_clock_hw()
Date: Fri,  9 Oct 2026 11:11:35 +0300
Message-ID: <179153345648.1914323.15178647656208865959.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915055631.1730231-1-vulab@iscas.ac.cn>
References: <20260915055631.1730231-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX5LAFCrr/9q04
 3lp0CqFhoNVxffBCMh+hsfKDpXtGD6OcLPVKXR2aEt95cYFtQPTib/Ay5C0Zoc85ZE3rlgueyCa
 4UL+uwVn5BkPhecv+7grhX8R9D5z2ph7hcNxk/PdutMiRKuD8DjFGawcho9qS7FfhV0adneWxrB
 +EvWMDHZJGrQjopPF/3JwRE6PwuzFB8ME9bWZWYlfs+KXkWJXK5FSOBZjNkRe5E1cN2i8A6SXP2
 optp31hGEEA0R1t7cFdKZZmtelNertz8WEKcJSOUHfzg9Cn6MxIbaReJCOVVmxZdPgUgxQ6ujTc
 mI1qNWBIxwxkjZjri+oe9lQETkbNrpSUGVGglMRm0eKGnzpHfxGhJuIofzpL0HvgeoGNg1ccPdC
 /Z6gemjae3W0JVGHD0Y92EA7of8q02n0QodKd5FT9LBTZtFgpIDtj0IBm68QbtZPP1SFZeNoigO
 g9bfUBz5Gk2Mmh3fC1Q==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8a1c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7W_6zTuqtRk8UThwdy0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 8j_C6Gy0VUooouOYKnOUSr8f9wbRulz-
X-Proofpoint-ORIG-GUID: 8j_C6Gy0VUooouOYKnOUSr8f9wbRulz-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX7V7fejmfPSYz
 4n4yuFDIfXRtLKpD0j1+SNcaf73nShHVuY6BWJRUjqsq04A5/qpWmBqV2qD6LQfdgQDXC4TaOgj
 O6n+SloAtweWuekSMIEUB5RdPHmp52U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090032


On Tue, 15 Sep 2026 05:56:31 +0000, Wentao Liang wrote:
> imx_obtain_fixed_clock_hw() obtains the clock through
> imx_obtain_fixed_clock_from_dt(), which creates a consumer reference
> via of_clk_get_from_provider(). The reference is discarded right after
> __clk_get_hw() returns the hardware pointer, leaking it.
> 
> Keep the imx_clk_fixed() fallback unchanged and drop the DT-obtained
> consumer reference with clk_put() once the hardware pointer has been
> extracted.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: Fix clock reference leak in imx_obtain_fixed_clock_hw()
      commit: 52d4d1b26a5bc64de95099d0a3dd8b90dba1f3a3

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
