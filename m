Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612355;
	b=zSPJDqUBVAGV3VT0sHPw62I0X5hGEhtcNhg+N1j3ET0u9gXSd3SDqktq/wPoXDfAiAX5
	 bvEgbfbHvR1iT2LUiBlbUsy61OTeGfg7bAHN9cX5tyOjlYCUTBHr7nBMQKDy+t2rOWVnV
	 zAgT/Fgxa8RBwkIIaW4kPYxTkWEFnhIMynuxgZ34PLErh8eNwi3V4VqCDUbP2ywptf+MS
	 ArEtHrWTDchAdf00SMWh3yqX6OJetvEswXaeyN9+oB1GqG1SnBXc0Ftgsnz5PW2JvAoft
	 AWw4l9LLr4KjNQLvFVfsOKM0MyWu6rtFsZEXzmEj0nsfxwbeJDveHwd+qPvb5W1QeZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=;
	b=MynBXL/QUc+jmMKIzJE2RKwh6GneWf22TK7w8jxa2S9DiyvhVOtALjR3vhTpBacX7ptb
	 dwgMdWpSNM2IhRvAJuI1tygQqO9y7+WL2qxElywQI1rYlprP6uVhGgKM3aJ0+/UGpqMlu
	 O/ZyA/F08+5X823dqZ9o1Fmx4iH6X5UMJbIvmAyiIemH8KsLQI72sQZHRV7l8+LC6Kp3V
	 67SgkCHN55DB3Xbgo4HUaULNinVlt6bPDJmKiiy58deW/NHB5lgL7g4pGKmcdSlvcj5nW
	 5Vd+3hz0KTmoweb9GBR6dq+pTs3VdVG9DFWaCXFVru6dqb4rTPG6SeTEX9XeCrM+6SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZMfuYuMX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TO9bfWuz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1615606A327
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 09:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1615606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZMfuYuMX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TO9bfWuz
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AO2H3086530
	for <imx@lists.linux.dev>; Mon, 2 Nov 2026 09:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=; b=ZMfuYuMXuVHTnI2i
	yRZUsfLxhNsB1lBdsevMx40wIH3StJl3jo2kKp+g4KMSehmTQ0yXehaYpdehoLnP
	H0d75uGi1E1sYZP4lWoxyiF72Ja9RFQIj0qeTbTBYVEn1X+okz9Jr04uhFi8c3zK
	usZ6B6TSHF9F3cDWhUpQBzTpzksq/nfJCBNVWPX6xmPNqLq6lHzHimUpAORJcQrF
	nZ+gaSH2ct0wJBT6sjg0dM82nbrlB3zzYqqmdB5YpcX3sjMxJ2DlNtURTWrwn5BL
	4E0uCdZ9MBN0tollRRR/cLIN/XAf6BKtdezCntS/NfolOg14lHd1K8AmkUl1oiBq
	28BRnQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka615d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 02 Nov 2026 09:39:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c70349f65so60446206d6.3
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 01:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612353; x=1794217153; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=;
        b=TO9bfWuzCdXi/YG6AbQn08DR283ULYp0g9oWHYhy2C6tprXfwaqd9usNdweQz7exNC
         0UQHpQAkbQwJMTiM8dbdGWo0Xgq4jWsO/ha50JrJydRNrO+Blo0fOeNRPruBQvcKxqYL
         NPjWJ+LfS1WC+Pz4jPjFxR7V0p6pUfq1GHVOQj7xgWYU9ASzmloXOWTXDfK4M3hJrZTT
         QvN3JD8NAMYu2wu9VEPRxFPrxP8m3JZC1/zNDPyyVKuF77mmItD1qsoucUWhmECHt0WE
         etNrtl1ZfxSVkTUekr/a+u55g4J2Lwt0gv8IEME1R1FKTKPWxldxQBq8dEwh0lAhreCo
         cD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612353; x=1794217153;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=;
        b=FTlg+Sydo9j0WLAaYPu3ECGitxrOBpT+oKTnERj3OMvdzd73nenBjDjKryb8C5f50B
         +Ki61FmYM9vhkR9c2TwYrIHm1zUE8asnG4QTq6uphADWW9JRbA4mLgAmF8UEsY5ixqkh
         xS+kgElgKxg3MWfDPAGfdnlEj34xjvmNDGuVJd3PoEOqc7zCZV1rSF2mNIuElcsjC9lq
         sCGJrdbS5SxGB3A9J7/2omUyjhTQk3vLk7EMvCqFp3lhxliwFV5V0asvz5+KJLhgK3CG
         qFwrmvanFDm7bSje4ZWnnXGJTdhiLEeQLb4rxP/aT6jLqurnE8gG23Nbug88BoB+DzS9
         78Lw==
X-Forwarded-Encrypted: i=1; AKwUvBzo/YkbIRpQ03w5IQqMX5ZQomziWDkcqqVYh7mPlxvZv7P76Rr3mP4nkYhB9IMfPRICY64=@lists.linux.dev
X-Gm-Message-State: AFq9FYIMS4X5wNfAwObeu2PB5llGH+Xk2aXVsWRw0ib/69Bc5YNXWQB1
	TijjJtZ8+Jhj0aBSgxr8DEd4ka8ezAKQOqm9U7Rh9dbZ4G7dWlaISjBdRD6WmSlsH+EKW+nlUPD
	TIiIxg/zuivG1cvZwmkTbXcQ+qA3oLK3PWNQ123kYCYBYWp7I5BbwLXc=
X-Gm-Gg: AYBFou3yp3TTansf3qRlpWSIkq3s3Xq9jeZkLIKw7BE7Y794i8r6gKL5qFrCl2rfIvs
	J0tDbzBTpnpipjAN7mPdwUFnlkktgdjdHk1kOBhC3C++7nRgkCR/D7+FcoBJXjol/O5RJe+V3ou
	D/2+JHH68Rqnm7JxPV9o7QLT5/y6VYyfek4RmXZhcVJW3yglFvCxAe8tpoNrA3yujjHVDW/eCEe
	TvVKfFRRWzg+qIuhOTKsDWV9FXT78hnE5YIa9ltTYzSacJ7uDaNOOp9oHt/AVieCFSIZM9RseV5
	fo4lhwMRm9VC4hlY/Kns9V7xkhu5GgJIAEOWK0k2pvkQ7DJoR6PKtEuy7HFjpKd6inXyRvFDOwG
	C/0fbHt31xUKhYS6PF1Y5p8vtgwWKaJZ+YPRLChItO4RTYMsuucSK6juHap4mb5EjElZdJu2FNX
	fB
X-Received: by 2002:a05:620a:801c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-944217a3ad0mr1519530285a.73.1793612352666;
        Mon, 02 Nov 2026 01:39:12 -0800 (PST)
X-Received: by 2002:a05:620a:801c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-944217a3ad0mr1519525985a.73.1793612352017;
        Mon, 02 Nov 2026 01:39:12 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bab1a8sm18880436f8f.57.2026.11.02.01.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:39:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v7 00/12] gpio: mxc: probe cleanup
Date: Mon,  2 Nov 2026 10:39:07 +0100
Message-ID: <179361234152.49297.16476841533966255067.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rbwEMY4QiGghGD9VYnrTH6QFcyTIqfj_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX9NAXuKKxt5lO
 5cOUt0FerDbgUj8d3U3DnOX5mFesiPxHnR7qegvOsVCaqWHXN8POSFSI+yAscllvW4pvpiygfDC
 BHaaXcG1d79xTyIUIVgeyTsJKdY8rtU=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae85a41 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dTNmjvSPNBXJgja9_wUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXwGW+M3n8wlk7
 eXYJQbfuXt5qMmDYDmRR8cP9BmMxRoS+pC72bERX8NdUEMTzfg/CYEAQEdqs2BhQtyTefwL87BF
 wqYrq3uF5lFNfctPy1EzqHwsYZ0/wRJFjH1P3sqFFF+4sp5GW+EiFiTosptYAoTEN3NNnCu7BaY
 imdLYUqVScU3pMdorDEW2ch6MvEfeCYx+dz2fAbnRsz3/ydbFoD3w6ILE+pQENfl9YPObu5HvAb
 j9oYTvIuWPennjV5aCD9yXDet1YsE3U/uP4RUA68o1aoI28vfkrIwrEQtum08oNA1XABalRb/JK
 ssaGlWrCd2O7XXo38B2kDzBqfQZbhlbsO7WDiIqoGJ/8BcR9iX8KzC6CYFfLFkjXcDW1YcnyhKl
 Thae+Zw9T3Hq84ZsjZaSwMVrrcdFv4p6sGX1macM0K5/q2gTG3TsZQKvbXCxe5mLdBjvDJnTu3R
 /EnoDC89LVtsFAH9t5w==
X-Proofpoint-GUID: rbwEMY4QiGghGD9VYnrTH6QFcyTIqfj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020038


On Tue, 27 Oct 2026 20:09:27 +0800, Peng Fan (OSS) wrote:
> This is the cleanup portion of the gpio-mxc series, following the bug
> fixes merged in [1].
> 
> For Linus's comment in [2], I will use a follow up patch set to
> update pinctrl-imx and gpio-mxc.
> 
> Patches 1-2 are wakeup_pads cleanups: consolidate enable/disable_irq_wake
> into irq_set_irq_wake(), and use for_each_set_bit() for the pad wakeup
> iteration.
> 
> [...]

Applied, thanks!

[01/12] gpio: mxc: use irq_set_irq_wake() to simplify code
        https://git.kernel.org/brgl/c/f9922db7dd7ac1a0545e165b4ca52bca77394715
[02/12] gpio: mxc: use for_each_set_bit() to iterate wakeup pads
        https://git.kernel.org/brgl/c/8b56c9bc04d5febf1bcc6b3ab4020608f7b59bc9
[03/12] gpio: mxc: use 'unsigned int' instead of bare 'unsigned'
        https://git.kernel.org/brgl/c/fe290228900ba8a6351677a97feb5e7a8bc493ca
[04/12] gpio: mxc: replace of_device_is_compatible() with hwdata flags
        https://git.kernel.org/brgl/c/363f30458065046fc1ba1564a1932f5deddbbfbc
[05/12] gpio: mxc: convert pad wakeup compatible checks to hwdata flags
        https://git.kernel.org/brgl/c/eba30afc04687a53300011bfce94e95cb4050ff9
[06/12] gpio: mxc: use local dev variable
        https://git.kernel.org/brgl/c/569d0a6f57fc119c7f9471bfc7e0886070c6bf95
[07/12] gpio: mxc: use __free guard for runtime PM cleanup
        https://git.kernel.org/brgl/c/6d0d40d6d39dc0314a54d89ed1635da9df0c8159
[08/12] gpio: mxc: use devres functions to simplify probe code
        https://git.kernel.org/brgl/c/02f1ca1b7a56cb52813c476b9c881862d29ede33
[09/12] gpio: mxc: add dev_err_probe() for error paths to help diagnostics
        https://git.kernel.org/brgl/c/a0739c3cc3d414d981b124543d6b45eaaeaccc08
[10/12] gpio: mxc: introduce MXC_ICR macros and use field_prep/field_get
        https://git.kernel.org/brgl/c/5ae5ecd98ed2ecb81b8b27e184fb28a278193673
[11/12] gpio: mxc: use BIT() macro for single-bit operations
        https://git.kernel.org/brgl/c/116ca21f82df0eec13a1b949746aa17fa65c0a22
[12/12] MAINTAINERS: Add an entry for gpio-mxc
        https://git.kernel.org/brgl/c/2505bf94979f596f2b2146cc654bc28cc46bbb9e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
