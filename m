Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7E93BED07
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848407; cv=none; b=PragNv2TP/1P0Anwaw8lHnOZV4ytCvgPU9tLybpz3IZAuj+GrUDxv+WRpVzzZLhWV5nVQeJUbGVQQYAcasdkZ8NtUxvlJ0yXfsqZrnmpBazTI4VcGnz2UdnYmcEeqtrV+4VIM/Oyo2jOmv1OduONHETcIqX+NylfTMbuqCD92S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848407; c=relaxed/simple;
	bh=kXgPJubBBRMEAM7a00iwPDTnwE1WqVUydbhsabJSVBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sdBByx9I6luNYYtvqXwYiVFiZSbE2rPaZw6g1IdnDe8N+fcnl/jbFXTyR8TDkESm+uP7ZFVWidcLKnPNIyWRn/frTMpOUHlFaJWME7Po1lyo1lQwVuR6lwLpjMjlOBr9/VYLGHHFWBXUSkL0oHyDPKm5h4b5Vbzk6+r/D23FzX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTy/Y/PI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CnRsuJYI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTy/Y/PI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CnRsuJYI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFWuOQ894291
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIqoWgKmQyuYPfu/JHLpVodU4oDvKEbNfgj2XsNto0Q=; b=cTy/Y/PIlh+7bFqp
	FIrmo1qZ5qEsUdB2VmJnBdLzD2kLOJezYsUbkX/37bz2+iVUflOtSOBLHSiF48Sk
	sfB3BPxYNHezc90psZCgTpQzxFCwLdntTZ781JRv7KeZkPxzg9VV3bZSDB4P1Qy0
	k9291c1Q3Ziu6nBnH/Z7faQQYRJA+1GtXidiB2a2Deyf9PDJPw9T+dgAtgj8WbQ3
	2wg8CgOjOPbODF6G76wlv3yWiz8CjOOTrGHEhWu4p5UAK+dw4O4LVDyFKihVpC9V
	pJEwKdemRfCRqzqitNQ7C1PzZ+k+y0hGfugCKmnYs0XwcbcmzOtPA3srenURuuym
	ek4cLQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyrwwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:40:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso144556721cf.0
        for <imx@lists.linux.dev>; Wed, 18 Mar 2026 08:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848399; x=1774453199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIqoWgKmQyuYPfu/JHLpVodU4oDvKEbNfgj2XsNto0Q=;
        b=CnRsuJYIXo7Npef0XJEiougRPk7t5kmO1qZnGrxovubP6sEX5TnsENA9iMA6wiYS7A
         BIkih5fdeCntwuibBoXM7ypxw8v5hHY0SVz2dPGQmfZfOHpm7ketud4HhDnJeQ7B324z
         JajM6HYsu6jO8uRnk/nKOHGPPrwuQrlBztGym5o+eo/sqVfT0H7v3fDmykteBIfgDKKy
         1g+vI+MYY5dWtgum0cYhm/pccmiZYjt0AjkYDgjTkwokF5WGvrPM7HzyFrCFKbHGV9YK
         utu8HEobAB5LkMAlfVFA/opBrB1QlVpTY5GtOOr4C51RU2+38/4HXEayp/ylhmySXzXQ
         0MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848399; x=1774453199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BIqoWgKmQyuYPfu/JHLpVodU4oDvKEbNfgj2XsNto0Q=;
        b=BCJzXUcllJWmzb8qAo0F1PlkTQFTCcwf1hypq8yMmALLF8d4hzdNGeSuHJivfa3azq
         wBqr6r1+WqrXDyy876dHUAFDz9Vnd6SjC8kyNmDYyiAeu600k6Fp0NoniLO954Wlrfud
         pdKDpDskHWilW4yZ+l4pDmFjwfnK0WE1+xFWiQQsHy0ufM96TWd3mDPFo/8QSlPfhnwL
         0EgEGlhHJT8S9da7uvNMcjfQjuYDwXi5BJOwF/H3zhhxuqz/iafY7m6kbmmUGyXXvlAN
         hPwlWpBh2uiFg9uyy/WYZXk0X/KWlmj69KSgX/6xDpP37/+8W7cKJZLX5K7qFbM+lmry
         x0nw==
X-Forwarded-Encrypted: i=1; AJvYcCV4EZ9WF/h9DUdOGfPt1uecP0HNOb6raC3Uan71H2ZOL1MuA56coUKbf4eeKPfP9l9OEJ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlwGdHsHHLPbTNj3BmcUVGK+4xNw9gwiex6dDKdH+r54YYNDdT
	xP4K7E4Kr0vS2kMsGUYzNT/6D97ze913kSLV3eqLmT4KrPM9bHXmC19FDwU+o++GGYl8Njb9uxV
	wzIjG1viTEjUSpjevSPRfs4/g+EZD9PaJ2Tjer1uVG1dGUXvx5FLAfG4=
X-Gm-Gg: ATEYQzwtAVcNOteM+8Ix8E3mnEVQmscxdM1NC1NPWtLcF2uwNcEwms3nfWMK3hi3Z3T
	1LpOZgJ88PC3wePFaUy0r20VMNZ7hdx4EXEfOekVQeTIK7Rd1W8vw39FNwSiBUrZ9B82MKbx6uH
	QcYqiKOfosk8MStBtkN+joXtFth9rcAIq3GOHjgMlP43HRZ63IsU4vlccExCAefIqRkrO4pmpl0
	CR6bYCXiTh+eYaVPskvZ99l4Q/e7eSqRLHeL7mYJ0Q3Rp54Lc8ztOW+7GG3m5iujHSNCvAGjTOC
	ecc97CYrDu4erDjUvBeXIbEt+jIt5tvuN+xmsloOEonT6jB+N2zCKq6e3TVsiF8TlgOV+ViWa2Z
	51SYQNeIP8zJHG2O79KM+PFY4Y94=
X-Received: by 2002:ac8:5f8b:0:b0:509:3367:c992 with SMTP id d75a77b69052e-50b1477d2b1mr49860181cf.5.1773848399285;
        Wed, 18 Mar 2026 08:39:59 -0700 (PDT)
X-Received: by 2002:ac8:5f8b:0:b0:509:3367:c992 with SMTP id d75a77b69052e-50b1477d2b1mr49859731cf.5.1773848398744;
        Wed, 18 Mar 2026 08:39:58 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/4] clk: vf610: Add clocks to support MTIP L2 switch
Date: Wed, 18 Mar 2026 17:39:33 +0200
Message-ID: <177384710706.3709943.4851926053225673193.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260129095442.1646748-1-lukma@nabladev.com>
References: <20260129095442.1646748-1-lukma@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fMLb4j8J_RMidCUPKck4VqLKRhlUuD-X
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bac750 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=15QbF078PdIEimGHe8kA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX+zRz9EdMmpvp
 ZXz5dyTNwNh1UTKbP16Y0Y6qK1TJiA6xuMHZ1TlUPR+jJpJSVJw1v9xHl0xnwiNue2vP6EHThD7
 R+ntFcpF9Znzr0nY4bGThGPNI5vv+88xYZsIOJDyTS1/WZllaKHnMFsX0Bd3dwkzjPbwUlxWPtb
 43kVKx7rAD/MPC6kRmTrM+6u1F2zUBaDCL/fTWV/N+qrYZuFlD72NESd4vPVz3Mbzia0bZxZbRf
 Rx3lYeIQEm85d0RVSvFgecOLuSQY2PuoIqydoo4MCEqZjhvZfHTEIyGr+77ACQJ9G2bsnlxNKvD
 zq6E4zY6hHyOudFN18G7x6jcxptgF9F+TS46l+QChmt48XiehXuvgRjcVwBZ8lL0UQpzNKJuB4t
 cOu2NMP3YjkHJe15Sdf8RxKdDEmL23o4nVF20TtNBfUjAsRDPaJBkewQTIA12HvSIIK45skO5th
 FIZx9czpI3DMeHmwdxA==
X-Proofpoint-ORIG-GUID: fMLb4j8J_RMidCUPKck4VqLKRhlUuD-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180132


On Thu, 29 Jan 2026 10:54:38 +0100, Lukasz Majewski wrote:
> This patch series:
> - cleans up clocks' setup on vf610 by moving VF610_CLK_END define
>   to driver code
> - introduces support for several clocks required by MTIP switch IP block
> 
> Lukasz Majewski (4):
>   clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
>   dt-bindings: clock: vf610: Drop VF610_CLK_END define
>   dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
>   clk: vf610: Add support for the Ethernet switch clocks
> 
> [...]

Applied, thanks!

[1/4] clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
      commit: 2c53aa5878f9abe6975ca45591b8e3357794c0e4
[2/4] dt-bindings: clock: vf610: Drop VF610_CLK_END define
      commit: 216ad764f8d8c53b85cc74f6090f8d132772fec4
[3/4] dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
      commit: 819bfc68251484bb9ba4b6cf91279a80c0fd7047
[4/4] clk: vf610: Add support for the Ethernet switch clocks
      commit: 5567730bd36614d8099d73520760c298e80e0fc5

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
