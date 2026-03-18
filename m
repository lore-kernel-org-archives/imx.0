Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBCC2D4B40
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848409; cv=none; b=J7rvYOOrgiUrvv3oGpDUBDnx2d0Tw8KlEjwtTrveO/mIPQG/aUnyquou3rQXyAGaoT2WiEmhutVjqL1jlf8T6bKDq5JFI052kZZ9WuRrYsB37zQZ4CkGFN8p5hqjJVYkZ7KN0afi5UjEKRo2kFfYqqTAEokq+YBFX/0oVdx8FeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848409; c=relaxed/simple;
	bh=etlvi7VppNWudklM9wkWSdhdTyXN5ATgjkc6GZjzD3w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ErNJDDiyROMlN2EGhfe8Ppkz1Np8HvDCDzC1JC9xA8Izzhlxlrr11s72feI6d3Q6j46TKo+4OV3S57sujrvcKC2vwzy8bOhSvFQr8TrxIC+lf0CbM8TXt3aOa9nR6+3VpRxMV8AI5/LG8e6GSrOQqn1EzSbTnIWCeSytm1rSwMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gHZwafK2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USPRMlps; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gHZwafK2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USPRMlps"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFXktg3963686
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UkpG/HvumoM7VSFgVTUWwXsnalVqOMe13PJD+6yY5a0=; b=gHZwafK2fqZe6A1A
	RenqkFxqrnvaEhxyKxg8553lSwzrvh4ndksR1PpSdRB9VMQVi6gHgo2i2QsbDJVQ
	dIeIku9M+snfI8KcbK4CggJ4nkO5ti7dZly5zp+29zd35Nuf7G2qsrFDPhVf2YZH
	4dg6nILB2kXxAHAeKOjkfgd5wdj26o3t4GGE6MO5nzx8TuD6DNRUwZYqzyG2u47Z
	RNTabnOowhP5r7FzITN6rF3gW0ZdIbVqwNg/eRP9le5x4/LPNRp7uYmRb5vVf29R
	RpXT+FgadWUF2MvS73fjNwASSI8s4GGYBfw7sSO2Zt2ab9Pvk6Dgg+TKJ3EOlKL6
	gNJIPg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3vwdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:40:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090e08dcfcso144561871cf.0
        for <imx@lists.linux.dev>; Wed, 18 Mar 2026 08:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848404; x=1774453204; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkpG/HvumoM7VSFgVTUWwXsnalVqOMe13PJD+6yY5a0=;
        b=USPRMlpsoiGXNk+iS7KovaSnIX2NZoBgRjliJTAzQDSetflnrFBBIiBz4/qKE3yGQx
         xp70Rk/1Ht38KeR5IstRTKPHJi3e2mRudF5gsEu7nvlynISGO2+6r0WiDKJ65Xioirjp
         2hfx+S3IibY3T99UjWtEpY1WifeJw7dUDncCsMU/lCAwv5Tj+R8F2ZXA2ekQW5N4sdmH
         RKDmfry6yrVnoyiHtd0J2xEjoM6TYCT5C7QAt3DNO5EN+XvwqKj/Vip7m7PYrPFzAOok
         0aD+k2Y+260AONk/85wIzfcrAUugrmwS6lQacMaJaTLcN5BFf94ZQk13dNRfmJnRFIax
         j7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848404; x=1774453204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UkpG/HvumoM7VSFgVTUWwXsnalVqOMe13PJD+6yY5a0=;
        b=dXC4EvULKegHx/kIkZj4a8cR41R5DoPTUMIdZL0nXrOGaJl/SBAUqQthykFLsrBuvP
         seAWzUMvhtoYhI2IuOlrrxdMs6zz3IUqoXuxvCRcanPIjzsMq0h4+BKgNlIJk1SOr68N
         yjyjTocjuDAUvN5HJFo0rj7YgKNG3rBY7T0QApqxrBjUwngXDJlL62lSjmmGorLfvzEC
         EWwYYd4mP92wtlBzlaRhZA7HW4B/ayV5dcTLeISoClMIsfwXVJMNDGKJmrCODLuA0BGD
         Gh20DWmnKKp7kJrCbeC8NbF6sT4vA83ISp9ErLn9K3YxXx6xmxCCpkoRtxVGmRqldpQJ
         6Deg==
X-Forwarded-Encrypted: i=1; AJvYcCVKFBkYt+/nH29ubGbcer/n11UCNuBOgUt0y0a3g5VhUvC/tsujuqEj+Iqs2NJqovPoUKw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yznm3so0sBXb0GC4M4xTo84+mw+eZaQMqsFZ6OufFaVldPuUoLY
	tusmpgcm2eTbPSoFbhHE6AeQFXidSzTyMid7EJxQo14hdgA7VYGu4W7GcXD4mv80KI4AQ2mzKEJ
	rNblHd2hoGYCY+C4lzjvq0nLYsWpjLVfPaO7V6L3c41QZ8tsfu+uM3Bg=
X-Gm-Gg: ATEYQzyeKJC89HK2UQ5f8BTfrmuiwUAjQGZT+9g5ySlTYUaDfU78+Zw0DI3LOvxiMM5
	YCd1QHnjJjRa4YXQ0yJTIXJoV2tWw8nmh8vdsR3drv5wY5+/OD0IOfWwo+JAOjqdjZBV77+L+pP
	QQlk8cEdhaNUzReK2Wt8eFtdeuTNR5mB0VE2yV2FdXXBoPAeCsjORFm2hzLrdThWzZ1o5NfDZfU
	FtyEfoycnvJJ4xc8HaTqrTaas2SOEjnyZBTVbsatVs+/TlhfbD+hPU6zOZBtD1Sos67iixPKFCy
	2xCV56d/EnPfoLTwyoWavly02lzNzEqLNfdMneDGBBNAbwOR3KSU0MfX9C5OUfcxFEjdidZwpv0
	DdRWBgxLqWqnTiGvoiopIv1g+o3I=
X-Received: by 2002:ac8:5f4a:0:b0:503:2c16:c1f5 with SMTP id d75a77b69052e-50b148c2951mr48098511cf.48.1773848403705;
        Wed, 18 Mar 2026 08:40:03 -0700 (PDT)
X-Received: by 2002:ac8:5f4a:0:b0:503:2c16:c1f5 with SMTP id d75a77b69052e-50b148c2951mr48097811cf.48.1773848403049;
        Wed, 18 Mar 2026 08:40:03 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:40:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, stefan.eichenberger@toradex.com,
        Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH RESEND] clk: imx: imx8-acm: fix flags for acm clocks
Date: Wed, 18 Mar 2026 17:39:35 +0200
Message-ID: <177384710706.3709943.8065144215162763896.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260212085750.3253187-1-shengjiu.wang@nxp.com>
References: <20260212085750.3253187-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69bac754 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mEXvEbR-UhZ5DZ4btVcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: sKQa8lsOOGzumIKfjeb3ySlLe-pxnwHi
X-Proofpoint-ORIG-GUID: sKQa8lsOOGzumIKfjeb3ySlLe-pxnwHi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX54v00srhGmKb
 vD57dKjNnz+0jTIzRx750uX7wjTETJLM1wIYDHW37R0wnhwUxRkF5QcE3zBLywHjYwucvdQme1a
 GEsggbAVY1MyYLBk4nhvEb4mTZ5LxOv+fRtGHdQx3Lj+6FI5kL79M8fprzYvJ2aYvZI86bsaalB
 btlONJclgzWdgqGMzvJh9ePZFu0nCFy9WKHe4dXq+bvGdMSaSlbi4gPrcgund19IsWB7fEzhtzo
 45rR95rGGo5SuEUSfjgEwrLB5hMPVAA7en+DlQ2iUzUj1/T72c+cClcjm4PQtQeNfPLI+JJX3Lk
 PtwauXWb3p14SxqVlFH5dbceL2NELs7DdROFWSP3M4koeqU6tfrLQXPBDNehlSWmYHZ4cohW3PY
 YXKuWpI44HXxaq6KEXGc/NFmR17MLKULVzXT3ZnSLyPAvkElNpCwBrvqMItrNQDyttJ/DzivRfK
 /LE35uBW5YzNzi6zCYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180132


On Thu, 12 Feb 2026 16:57:50 +0800, Shengjiu Wang wrote:
> Currently, the flags for the ACM clocks are set to 0. This configuration
> causes the fsl-sai audio driver to fail when attempting to set the
> sysclk, returning an EINVAL error. The following error messages
> highlight the issue:
> fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
> imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8-acm: fix flags for acm clocks
      commit: 01898eb94e4e7b70b6e89f874494cc18f4954e1b

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
