Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF8F52758E
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 12:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066894; cv=none; b=MJ5o7okc+JZbWdK313QLy7HnTmsj+tBnDzLiFsmj86mQQtf/BwLeFG3iR90oAR2SyM7n2NPKfXkYxU6I6RyRRc0zHzyAD8qtW7bFrc45v7jpQQJC0KK+iohtGyIDQr5mFsztKqrWYmhWaXhgYGRsc0oAlwk3WqLCeMRFUvYVfy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066894; c=relaxed/simple;
	bh=Wze7BopAd+EmWC1Uc0aVJpdVDI8Ue7K/O1WBlJdyYv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NBs3T9KyvGIp0/dVZcE7sgUvBCpNXc3MG4WekVWpas04fFl3YdMNfiLW53QqRyxPF5BQS0lmjeYnQyDqRdS/YIBipqccyRRgzkWJmCeCnwqGRk8VWDx+v0WkIOTejEDTD0rA5zW5SfmN5ne4yGqprd9yjrQiTHI1RLDE5nxq1v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUKVqd1X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9fjJQsx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUKVqd1X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A9fjJQsx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jnjN3408850
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 12:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uOFINkoyaoIwUdShZgLDnM7JgCoxlJqF+XqCJgYS6Rg=; b=cUKVqd1Xe51I2+l/
	JkxqpjvowwnZ0Mh7V2dXR43lKe5YBQXPIpP7MuaJ7vlfpNaMoRUPuwv9+s8Wwmz/
	noLlSZcdHmLvd2qOuFzKk+KEsXqL037ylSYh5n66qeqlpPWxbEP9491ZgVT9JmJE
	YUtvDB8R376h6+kFQeiBCy8fnlULXFrMY7EpuPsqn8CPRq0prAqRiWmsjLxfzoii
	IM6piZSFpNPQMX7bP4jlqKYSDxa4+AOFnF8Jz8KpbZF6MtPm0jljtYWMD3TR3woZ
	OmT70xh2jtCszoWZTio4t2lJM1g2BV23SC3rCdNYJfUJN9NLQ0dCVYHx94wZqcV/
	JytFzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn2ps2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 12:21:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dea1b6c89so977780385a.2
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 05:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792066885; x=1792671685; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uOFINkoyaoIwUdShZgLDnM7JgCoxlJqF+XqCJgYS6Rg=;
        b=A9fjJQsxac0xnK2NSLjllOqfJJgHNBk3cEHnOb1djehzZRB79cAqn/0T25JWaPY4tQ
         JM/Ftap5yG9jo8BxPMU0vjEAPeYoCdiXgKO8snQFld3KTVDqmwgMe7va0UrL/0QKdYWf
         OO76GdMp9SK26YZJsVF3IXHCo9Gn+ky0oshyvGC57ow1IXatPKpUdYdtYlDWI+e+o5eH
         /76+95EWzigRQCR8HBd+MrK7mvsprrKlDCLQx9+a1HlKkkRh3a8a4ibD0sDWJNFlDS6D
         Fehh53v1lFpEHAXpvC7/9xQOg4UhY/zX6JmJ9nXzrOxLbYeOlJlZo4QrNnZo7u25mw89
         k/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066885; x=1792671685;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOFINkoyaoIwUdShZgLDnM7JgCoxlJqF+XqCJgYS6Rg=;
        b=bsJIvElXq/omS2qK4Ze3uqpxEl54SJRsnJ274CIkc+fVuatpTgZvq01O+41uRmnbR0
         IeYzZV4n3kngtBEmgTzCUeyS6QxiWOjOFOcnyhFR6jRApnEFPnS8k0XghFanYMB8lXda
         fWfEv8u0+AKMJ1vUHzzuS/MgxusBHWQckm92pC8rf1KlwHKt2wIheeybA5AozoxutwGx
         FaZ9qMohmwx17LvaDikwlW8JCDcyQirAIEFAJPYeAXLjKpbgGMeCVrL+g00S8z1xjalr
         8jd4322UqBX9gWFW4F3GiCAkEfzoSx/T9LJQ89qlk6vC28LS4BAmWGj2achzzaqBQSi4
         y2MA==
X-Forwarded-Encrypted: i=1; AKwUvBx6NLrbkDGCZvUL7CnHb2P+/o28DcpsNEj/yRL13mKGZGk3vWcASREBUW0fHpKtef0yJcE=@lists.linux.dev
X-Gm-Message-State: AFq9FYIdzDcgE6Ug5nQae/Q5Ci/8vaX8KgQjA6nd2IE4aXeMmk0e+S6J
	VkWLyhMLJ7gCP7YrHvYSGFIdJYtH5yh9fxG9v8gYsBtpS43NSPoK4LZLx9+TmXJ97VRB+tLztsV
	Xe0Z36U1vb8Hgmd17Cd4PHBFVYZAOVvP3WcaBNug4I8nuBD8/QDkSI9sJB5muNGw=
X-Gm-Gg: AYBFou14/syML8iaYxsMOvRHM8nkl64RN0sd4iMV7cg2CGjOgaNLnmLDZkxC3CqjgKA
	Vtm6NVU9RJARmraF/m+hzuKNIEnh8njU+oo2XhGFsVMd84bZJJ44x7VDLwQOoS9Jk8kDcs42I2C
	xZjaC0UJF7hdL6RShi/gPnWBzJbPjcfu5a8jtByZfxyW8dm9U63tFs0ftzgU1tvWiXmFrRNtuki
	hOHaealP5BV1edVYA9LADpee4rdvCW9n5ehD698ilVwKj0g7x1u5e7cbTuf7ySIJeErEziooGtu
	2Oyr6qNS5rqifzV4WA7sxC+RJrpy8Vt23B901gKFjIjqoMYoycCTYIlXtGryTlrjL0PR006KvBG
	hm9Is+Nn6LutmBziYJZCnB0i9sAo=
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fd with SMTP id af79cd13be357-93ec12c4a90mr2887411285a.74.1792066885283;
        Thu, 15 Oct 2026 05:21:25 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fd with SMTP id af79cd13be357-93ec12c4a90mr2887406885a.74.1792066884748;
        Thu, 15 Oct 2026 05:21:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc5e0asm18551537f8f.50.2026.10.15.05.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:21:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 0/4] gpio: mxc: misc bug fixes
Date: Thu, 15 Oct 2026 14:21:21 +0200
Message-ID: <179206687877.10309.9401675786609225009.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OSBTYWx0ZWRfXwgFtIgnwVG4p
 Vj/gag/9RTHZA3EqaKTnbHUOHEJDCfOdSkD5uxxtIgYvHpVP5t8Wn5H5BYqbe0zajVj8qELRKt5
 ci0Xf1jvnpM6J6oRzJ1RKLZ77JmTmECOfQBFKv8lDjVMFTSNLQ6k7e8GnmlQaLw07fi7o4zLLv+
 861UG8h6p6A6YHDNEBQAY9W/jFZvNhByqbPAJ5lfdn8VidgwX8VkiiOKtJVYZaj8I0nxm2Qxzp6
 PAg6okgc/2E+lIBfGj63FU8iI57JAPnmBo6E9eRrNXBuvyIzH2mCL42UqDdAy7mHTmhWRkPO5Ao
 mSEc+4qbDh6M/MluPuYqvTTquxBXPdgC1p9wbsJZVz2MXD/IpbjDGUls9Squ9FUaAs3oFdnM4xr
 yZxDf5wp3/PoRxXtECg0roNdvUWvbbTWhafafdgQSAe66xB9sQFiZV1frrsnwZfkKTcXR27kIN2
 NMpXLTgGztrHy6EI9jQ==
X-Proofpoint-GUID: KUcVHwHpo9GGXFseZDtWyl_0bzWr84TG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OSBTYWx0ZWRfX3+X7KPQDuIIJ
 NrthDSmAoy64KiX2+imN1WjnYWJZIWavlTXJdMohJj8TD4i+1z26Lic2853xZsTAvKwQztIgErk
 /wJzZpI7lUtCB2zUX+lBaXDQbfQDXyM=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0c54b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FbT2nVsXUnx1RHKrfWgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: KUcVHwHpo9GGXFseZDtWyl_0bzWr84TG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150049


On Tue, 13 Oct 2026 14:01:08 +0800, Peng Fan (OSS) wrote:
> This is a subset focusing on bug fixes, that separated from thread [1]
> 
>   1. Fix a race where the chained IRQ handler is installed before the IRQ
>      domain, generic IRQ chip, and port list entry are ready.  An interrupt
>      arriving in that window dereferences port->domain while still NULL
>      (mx3 path) or walks an incomplete list (mx2 path).  Move the handler
>      install after all dependencies are set up.
> 
> [...]

Applied, thanks!

[1/4] gpio: mxc: fix race between chained IRQ handler install and probe completion
      https://git.kernel.org/brgl/c/38d44f78f041ffe60c8e2443b99434a199e7541d
[2/4] gpio: mxc: fix both_edges bit operations
      https://git.kernel.org/brgl/c/b7719c575dec69146f6d537fd616b27083c0cf45
[3/4] gpio: mxc: fix wakeup_pads bit operations
      https://git.kernel.org/brgl/c/170aeff46fb54f41545c85a72aec525aebc79d44
[4/4] gpio: mxc: fix race between gpiochip registration and IRQ domain setup
      https://git.kernel.org/brgl/c/205cccd06e545694754e1bf8d626ea96e742cd8a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
