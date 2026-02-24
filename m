Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933A327CB35
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771927082; cv=none; b=dtRhb1VpUphIxvhDwYGXyOH6WH5m2G7iJ2qpIJFsPCGw5LLJWqLezImdgFRNHFGWSO/V7K7rdSdynSPvcTY/X97C3vQyrVoBvfOt+zJwHZAyaLIqnON6t5qWOA0Ntd7Gs9I4sRoPpK0b2dGq2qOYPxJR8AaegbkRiA6BWNpzEWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771927082; c=relaxed/simple;
	bh=Iv0RU8ESXCGS1lmPLquw+3+cIGz1w0QV9/R+DRzRtQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqHIPRWVWkL5JOjQAhmsnEOFY2kAfhtHlFvZ8rIj4gJwbHAvsEGGdNkXylo7Bx8cByNf8nxcvk+ZDJKmRCAGDnpoEoCogTV8jU1SdlaY60V0KYaSBCkCZGnbv3rDm9BrYFtSmxxz6Pn4Hcx0ozE6phzbHo9SzVCUXIlRdLdLJnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ss/EfuRL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RzpAjc+I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ss/EfuRL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RzpAjc+I"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O9sUc91958828
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 09:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=atWeCfnf8b/NdVkyr56hTky4
	XjjMPB6Vdu11M3dtNFs=; b=Ss/EfuRLxJD4Jo4rOx+5N177MtA+FEq5jQgZ1rkL
	W9tFvuyPEQRI7ZOjT3HZqiqByKq1zXOIIS8GytrhpNV7SeOvoy446wsSUrGYL3D0
	GbbegVReVhjIQtLHy+BFD5lEwWCE0FGz7mTpjPbtuZUeiPgGpEcwISVajjkinrj1
	hYnYsp+0WTPbx1mCUpdb+5tPgILMtOeZ2xb7Xu1bUbWLU3Ke2z2Tfu0aHDCNb7V2
	yHHD0+ZseoyurIgCbiXo8xIbI7HLj+r7N3Zzn8ZMoq9TxlxlrX4zt+hGA/0w7B+/
	JeAREjw5j+3gw6K+4WEIPdEolGgkeQK00X1rFclBBz9LUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch45691m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 09:58:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c881d0c617so4496375785a.1
        for <imx@lists.linux.dev>; Tue, 24 Feb 2026 01:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771927080; x=1772531880; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=atWeCfnf8b/NdVkyr56hTky4XjjMPB6Vdu11M3dtNFs=;
        b=RzpAjc+ISvFJaPXy4iUur7GsseKB/T++xHsCYfGhHr4rMUiVqv+1/upkkRZ7TS2XJS
         sYjK6cCDcOZPQoPh/uVP01DhTDf3fenkVVs2sEUL5RTSqdaxpcfccRTQcj3z365SeGuB
         VqzRCr9Fdfod6fOtUc+a6mPjpFHmEYvjFsFbZm/FdqXlFw6xjiyhSeX1+anbX3aKvJz/
         OB7NL5XOGdp5sgk+wDAz3SKWHu3Z4NDkyb3S2AMWG6jGD0mgU9MDsZWWS1JhwlvZLzE1
         BAMCrwVtYWBr9Q5Ezs6AHOlkO25zK1kNnVVZqBlM10t+KaGl6SQrtks1lLFNOh6mzdDs
         uOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771927080; x=1772531880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atWeCfnf8b/NdVkyr56hTky4XjjMPB6Vdu11M3dtNFs=;
        b=AS7K1cZYaxKnVsBOP9XNI9e+jRQ7a6rjGwfxLzzbPnxEZkBNdIRcIDai6VbQ+vIIbF
         LDg6mLE5e0pWoLNLQFpjLqAXd10B7awjj0E5rDMOaE5VD9jqVEcxqyS7plFlsb0fOBzc
         c/ViecKCQVgWGqxy3agSiffUTFhT0QzK+NpvuVH6Nmjmlv2/qHFoKalCqDlR6gI6YYph
         AQyHjRG/WhefXc3Ikp7OIJtsmJlwKntMtC40+jdRttpdFxv2eEd1MnhqBU1QMGJ//Rf/
         ZrH6ioHtIGTeQOkeGi0OcXpMBy3K2ZOSvT29Eej9QzlIiBDjVceeUbCgIOgYBRSLyEW1
         Bj1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOL4e02UcqraRZGf+kbmq6qlXR7P2cPT2NtfhmkjeauhfiPwEX1MLv5Qolkg1t2ixD/10=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfnISPd7QxthPtFS74FS4ZuV2PmMRKu2zMWnxFmRZ75TG5D173
	Zvx3Mdr8EVK5SXCf67AOLQhkttBePwe08DxxjroCmPATEgKDR+1vC8EDSUhtLpTZUM02nx8/Ygw
	HMR7P9iIxp8Pd2PIzj6uzWZ6G/ZA9gIZ/+rchXAYGKhoYYZMrnKE64Xc=
X-Gm-Gg: AZuq6aKpcp7Kq0pta1hYikq0gw1ERbNdkIfNWXwHGRrolNzsTYQ24Keor9sux7uNDN9
	/ertUUWL6KW63bpgEMlhIvhFElg4RLLOxqT4CaqoFyB8LQFLn5nI5rF0n7izxMbKF1SmFpYHRWB
	fZqQdD3JAfOuzfA5omLyr6+zejp4NHAPV8eeMRYdbTGYDbBF1n7s3XNYbQI8m8mmlmi+LHPUsY4
	ez+Zxh/BmTTJgfQgZJr9wPAazzGP12QhJozV6tiA/xU8LNdkglQRomIaRdXPMkvL4nskv4ub3F1
	pS6DoIj0Wewj0+Pc/QXwmm8rQNXp4O7gkBJQwsJSM1S9+cmAk9k3bFIOkgfqXUsbz+vjty1kJdN
	et9+yigjIOFUpRBxm4Qw+dJQb/Qb8FvGxlvfH
X-Received: by 2002:a05:620a:4587:b0:8c6:d64b:be43 with SMTP id af79cd13be357-8cb8c9d1dc0mr1513681785a.6.1771927079543;
        Tue, 24 Feb 2026 01:57:59 -0800 (PST)
X-Received: by 2002:a05:620a:4587:b0:8c6:d64b:be43 with SMTP id af79cd13be357-8cb8c9d1dc0mr1513679185a.6.1771927078924;
        Tue, 24 Feb 2026 01:57:58 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00768sm24787904f8f.10.2026.02.24.01.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:57:58 -0800 (PST)
Date: Tue, 24 Feb 2026 11:57:56 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, daniel.baluta@oss.nxp.com,
        mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Message-ID: <66i6cgh5zmz32ikwjvrz3gtezjotltqmfzdai7ybwjhanx3bif@i5g62ziautwq>
References: <20260212235842.85934-1-dakr@kernel.org>
 <DGMMD195G9VX.245Z0JMIYO9HV@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGMMD195G9VX.245Z0JMIYO9HV@kernel.org>
X-Proofpoint-GUID: If1C3Fbn-Ongj6gAHTP0NOJKNLcp4tWl
X-Proofpoint-ORIG-GUID: If1C3Fbn-Ongj6gAHTP0NOJKNLcp4tWl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4MiBTYWx0ZWRfXweTPVYxxzB0R
 1WKuiu/XlaVvbQYYwcCGnL57qrMZqDj31bjT7JtWCru6UNWl5j+4AX3JzS5xJXwdT/BxHRl1mJy
 fpBkAx7OIVHZm1SdhsBqQO1EqO1/5KyTf3ZQR5uTqvYNYQEVMt/0bSa/fhRYN++4Q0q2EH5vzfQ
 IT7NONXRIKhxRc9gA3zFwlxKPX2lhYR76+WCm5+ctDyGjGw8CGpRD5mbrGMTj692D0nYt/gU4bZ
 Nkdss4mjod9wd/NSBMdU3BpcOV2WNo6YyIfiZOV48SZ2wh+/7ZaNzPBnetMT5QO0hpnPAUgmWDd
 tx4d/wqdpNFHfsNNcDKGcW4JpLNtdqljFVejGQ5Z7U5TwO6yvgA9vrRH2atJt0Xx7r/0hfDzSVd
 oP7s1qhPMM9NuvpRfuEU+sUeiOITT0tkh1sUK8M3pmeGVJ9xa+fBpwQgBnq9vf2JQYTqP4/wy7M
 Ve0xZcBfnS8hK32ZiOw==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d7628 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=8f9FM25-AAAA:8 a=5g7N3gLuN7TUrZyG1CYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240082

On 26-02-23 21:21:29, Danilo Krummrich wrote:
> On Fri Feb 13, 2026 at 12:58 AM CET, Danilo Krummrich wrote:
> > imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> > called from IMX driver's probe() callbacks.
> >
> > However, it neither makes sense to register drivers from probe()
> > callbacks of other drivers, nor does the driver core allow registering
> > drivers with a device lock already being held.
> >
> > The latter was revealed by commit dc23806a7c47 ("driver core: enforce
> > device_lock for driver_match_device()") leading to a deadlock condition
> > described in [1].
> >
> > Besides that, nothing seems to unregister the imx_clk_scu_driver once
> > the corresponding driver module is unloaded, which leaves the
> > driver-core with a dangling pointer.
> >
> > Also, if there are multiple matching devices for the imx8qxp_clk_driver,
> > imx8qxp_clk_probe() calls imx_clk_scu_init() multiple times.  However,
> > any subsequent call after the first one will fail, since the driver-core
> > does not allow to register the same struct platform_driver multiple
> > times.
> >
> > Hence, register the imx_clk_scu_driver from module_init() and unregister
> > it in module_exit().
> >
> > Note that we first register the imx8qxp_clk_driver and then call
> > imx_clk_scu_module_init() to avoid having to call
> > imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
> >
> > Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
> > Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as modules")
> > Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8x/MBa8x
> > Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Abel Vesa <abelvesa@kernel.org>

> 
> Just a quick reminder now that -rc1 is out; I think it would be good if this
> could go to Linus for -rc2.
> 
> (Just in case it helps, please let me know if you want me to take it through the
> driver-core tree for this purpose.)

Sure. Go ahead.

Thanks!
