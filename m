Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A526A332608
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848400; cv=none; b=GSVoFwdlR7r1f05czgtExTIALUOfZEQRmwCZuq1r8moBarN7NUW1uY/3uV7skG1LzRhaepRkmPYCXJJi0OOik9VIWUUAL/5UD8R/eoeHEdMzuAHlrCl0o2J6tUVEGFTQWSJuOrmJ5Pw44DoM2Wf/9/aYmoL+FTSci0jMoJliOLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848400; c=relaxed/simple;
	bh=gw69tgcoLcSxsrdQYQcrD+/RXmEiNDvJrjL8mPOGUaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nF1qInMVszMe5TeVc7qbsdmqB51QYp6tdVxtcCvE30wC8S88dKtgRbt5zNgVyTaFzBs84boobzgt8BZL7MpKkt7fWvVkqxngrCIjalOoAFTRPPcucWQg1AZ3+hWE+8xSAFU5IQBgh5n0404OfV7PQzfdq1Ylc1e8Uh81oEJXwHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRWNwILl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SZtRj2oS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LRWNwILl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SZtRj2oS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFXCsf1768920
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iXY6wf+7y63C26nOd5CZ2U3ebxiVslPLzrbxrFszJYY=; b=LRWNwILl3nqlah/m
	28mzsgN8aYGvXAZI/X+/n7iVRTLkK7uE+FXL2VeLE5nC5/s7FrZXH+kX0KrlKI2f
	q8ZNcnXd8VogylJ2AkTbyrvXGl6LmPVTWBh6k9BGooD94+PxG5ML9bwgT5LN/M8z
	+3MogOSYUR/SvoHObh4CXl2gNTfla40fUkVmeQhcybYnvlYb2qJwYlLG28m82Va1
	sF1P5f59JDfOBoPS4tWaZdwKYUJEvqM1479yj+i1QwZz4+1PX0ml/WDtx4wwQdcL
	biELnU972j5PIujX7n5GaS1+VCnbEbGpnNqtbCHKXlbzxhtfmx+Eoj3tApWhEFpQ
	zbXl0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqetx45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:39:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090bc4823cso204464541cf.3
        for <imx@lists.linux.dev>; Wed, 18 Mar 2026 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848395; x=1774453195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXY6wf+7y63C26nOd5CZ2U3ebxiVslPLzrbxrFszJYY=;
        b=SZtRj2oS2PTQMnmvtYaxOyIHS6/oI9h5e1JWoLj+C/T2Y72IKBNO8KAuXSEwmxs8oZ
         Ovbgo0RzwoptghY0I1vvBI+vZ/xZ8aaS9rYiVmo0C8gHyhQqGEISMwade7q+mJkCmbVQ
         ZX5DW2orAYzfCqn3oMeZKnXZzNDGZ21q8lfwe/pviA7v+29pO5m0d0i+MjCMX/BYzYmw
         +DgYMYY+CDTl3jp/uRlPEZKMNKJF28sB9mRB6Nm6aiitWNl9X4aVjmrUtw6ouKAtlvMe
         13s/JpU46MZMrVxfOfwf2PtQW0HOWY9iUq8enpRCo8VUGzzqwrrq11BFK51Pyxj78X2I
         p35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848395; x=1774453195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iXY6wf+7y63C26nOd5CZ2U3ebxiVslPLzrbxrFszJYY=;
        b=EuyYdwoeGVXFC8YyRZSlCn7VGKjATpL2Dq+SJLn/SlBcnhwTPs8eFY8gcjzDHvGM12
         ogdy2E6Qe6pF65b1Tbaq5qy2l4t/XuH3aGZf9VXaZICSLXdUq2Bf7qov7r3s47l7W9Uz
         GPzkvFoK/U1h5bB+oFqCE4z+zouOuKTHNL7U+y9AnDF+9OpleYMzsPImOY2xz0ctBt+E
         O+lECOmo1h34pHHtuGrEXbWhzHOJa6uMyRJoXPNx/TDgRxGKAc7UYbrt4Epom53BPnEu
         XjYMcD+zyrR2KOgRc2h/lsT5bhygwu1RKlQm1myiATI9k2DYl/+856HfdlKnB4bdy6FC
         CbSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjsRP1VoLaQbPvIw2estx0NkicNwBsacSP5YNgv8svTVHpru11ZNscRL6VIY5xE7MB3qM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc2CcFy/eodjEqiBkh3pAR9YIbh+UE/ZpxxGflvuL0MBhqD4RB
	cOjLvlfl9IboH74ErL9XDeJsFNiTG6eMgBTsNz9yVXo8uXFw08bPiHYUqUBS8Wz7VgSiAG5U5l7
	lEUOfucl4cG/x0PyVWJvr14BZo9AuYhCU1f0UuhGN+/oqTJMH/qYm4J4=
X-Gm-Gg: ATEYQzzngrXoycCJJ3DGzZRaeNIPqwJoBqCsXmLTbOVDQejZzYvJVIvPp1SbbIAIPiY
	30qsgg+917Qx8eFkvuSbZZ4NNxbfHQATMkg/4mnO5jGF0SMxXa8EfE5la5lr+DmewpV3JASfFh9
	uQH1hwAJBEWVOB1kaT+6N5ZUYIAS7ZFB0TL3eXh517Okkz8rmXyojIzd81FewJFPsmwDGYjLC7W
	nAcpeq918p+VSKd4ONkljne1mLQYEjsHkkDP5h3hqbgxItd0NKBkdXJQjR8LWiw8l2cnIPtTj7h
	744VLdAZlK2gUlg+JEvZJ8XohkQg4/mZukeQUSpcbVSvaU0VBdqMRWV5QB9B1viad6PtO/vpi34
	DaR8wCMdXaAE3yQUsrTJvH688xLQ=
X-Received: by 2002:a05:622a:344:b0:509:44c3:5ff9 with SMTP id d75a77b69052e-50b1485f448mr46464651cf.37.1773848394630;
        Wed, 18 Mar 2026 08:39:54 -0700 (PDT)
X-Received: by 2002:a05:622a:344:b0:509:44c3:5ff9 with SMTP id d75a77b69052e-50b1485f448mr46464071cf.37.1773848394077;
        Wed, 18 Mar 2026 08:39:54 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH v2 1/1] clk: imx: pll14xx: Use unsigned format specifier
Date: Wed, 18 Mar 2026 17:39:31 +0200
Message-ID: <177384710698.3709943.4935089017687987129.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260317121953.1100619-1-alexander.stein@ew.tq-group.com>
References: <20260317121953.1100619-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX2wNNW9lesA05
 zM/EABvq32YAqiEGAxYKmrcpvISTsADT3Ez65ocYEqmeY0/jGMTVyUFy9lhMOTWhGT4ScdfoKCC
 aHZggndkXCu3qNzpLOgQvRqb+7oFfkx03kJwAlYp/rSuYcfxsDDw6Cjs31PnDIJPjHEz80mtFfm
 CErXbMQeX3BeWpvOnavIR/W5V/4Lpz5AJszqLoqYjjcjHOjZAh7PE/CgWRhaf1qXplHZLXHmiBt
 HgGpXkYr2J3RdWjeldRP6A6/WP1Tt+3q5BLG62bBKIcHHLuuPSaFlt4RdNozL5DL317zcYFJhan
 yIEzFtFEx6reutKb9OaBP2eqDiVaJrXlinSU9DtrZC8sNWAD8MAbskAmboJ7fUuHnF+mxTtZ1uF
 rtJYYWf+sD7jWDaeAYoFTV1rBKWCmqBjL3wwOZ5/GO6BGk24x+00ZJ4tGr5M+K6RgmubK89APX7
 10V/78x95i/xZZ1JvmQ==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69bac74b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=r2wPyHcE3phNYcTLgkQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 4KBJ_3mZDCohdX0Tu4s8Q0RGepPNAaj1
X-Proofpoint-GUID: 4KBJ_3mZDCohdX0Tu4s8Q0RGepPNAaj1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180132


On Tue, 17 Mar 2026 13:19:52 +0100, Alexander Stein wrote:
> The debug outputs use %d for clock rates resulting in negative clock rate
> during rate calculation.

Applied, thanks!

[1/1] clk: imx: pll14xx: Use unsigned format specifier
      commit: fca8688a6798f6fee6b86ce0bc39d1cd0b1c8b8a

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
