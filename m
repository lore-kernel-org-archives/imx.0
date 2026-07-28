Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015E33C457A
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232795; cv=none; b=cj/W1wI7nXu/I5IO4tKKEMrd0cgEyisTfebUthsAIOzP7sL8IhJ+hsDqhmqIttlNSEzqCAqWrz2mDg5Y6x1o1kTsGxVPwk6DAykXY22L6DMs7suCoWKPXDpI3LDnH2wKIa3MM2XPVBrOzLBqcb3IpnwCGUa5HcWOIaVWypvI/cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232795; c=relaxed/simple;
	bh=+0Wbn7WCEuDzhQgR47IsKajWKvA2zjxBMfDYi8y6aYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssjJNxnOuz0dfI/7leDbkjDyOAAp29+XsMuzAMzdnbuWKMW8UiXigmqVcDwl8r9G4DojTR2sBAIWjZV7pEXN05wBVSyLbWgZLnWr7Uug3Fsjiii7ODhWKPXwnQzLO2eRgWEUrJrnuKfiZ6jnpBkzmo2X81wH2KtKPCmzZVX4eJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1ev1n2U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RsTWsUk/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1ev1n2U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RsTWsUk/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82not2309797
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 09:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U5PN1TT1lMw7TFu/s+fchO87
	W7nUXA/Ck6/FI9wxkQQ=; b=J1ev1n2UjmCEGnDr2A3w20S3xTEdMbyk2o0n2O3b
	uydHI8Fdeh6KmvEcUuikaqnKHsiZRMxfXorFisVwty213IRNbxOFTqYqI3AhFB04
	2CglaJ7ckrkNZ0aaVIds/BzE2qKPgBo4kTvMGXmIeTvgDk/7CSrYHgNYcCUKyoXn
	DU/kSTJ7rAHH/q5jiwTr1yV6Pva1HsPkvCIF11KSqlLbd4hrwQv6zFfK8jXEmxXF
	RFJthzdSlIov3kNjOQTSIFSrcJaG/I0LMHODKM3hFbk3eAJpVfGRdY15vBqD9RIr
	YJmaYfwyqdp7xuZOpa/SyTsoQTdvKpddt177lKG98FlhfQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7j5g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 09:59:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so35816301cf.0
        for <imx@lists.linux.dev>; Tue, 28 Jul 2026 02:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785232792; x=1785837592; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5PN1TT1lMw7TFu/s+fchO87W7nUXA/Ck6/FI9wxkQQ=;
        b=RsTWsUk/gSxXVZQbK/3zqG4fz1+/ThOa3UCYGrJNACAW8wOQZb05l+2H0g4Vua/ULN
         ojfUpYqqeXhKRwHxgkn4/UTaXvRqrf9g0wKddaXHgMQGPlB/Il88oCTty0vVDYK4OxwL
         jE0a8xq64yFaxui7JBXz1mJmig40CDYo3QSWv4AwfUr/pydhzoVS591lpQRkYZoRbCey
         bS0ntto88sKGcvKvTavFkjOGJ5M/q8I+qRpKUsDx41aUYnLr8c7ZNYxWRRyqG73a/wF6
         sg+s+rJtCRJx72fkudPLUDP06hvVF3CrYcS4Ttxtva9++G23SrzM8wtwKHeKARnDxoA2
         gNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232792; x=1785837592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5PN1TT1lMw7TFu/s+fchO87W7nUXA/Ck6/FI9wxkQQ=;
        b=Vnb1OXO+dKtshBzX7LCiGGYi0LcfHCcHo1/a5fNH7SucZxENxWwOasUW9QYmbnpa8Y
         yq1ccTaDHLJHW04U8FWgiW3zBLjSg+dcOlXpH7anMAlRt8pjML1Xw/GARWB9NqlDToM5
         SXhmAPViKZYfn0oaxq0DII1a5eCCgMvnXS3xI4Sgca8iGv+Lhz+vPwTrqYCaq7mX9+DM
         Ge0qk5JtXec/OmylLbK785Cta4h+0Cnx/JjR0XR3AJgabFAElzJj5LeQnHjMm52lnbcK
         5G1bfC0fzRWdO9Y+3nN3iOAspXmsNOfAgbazNwJxuGr6OI3ApqVODYRsXloSs7PxmtXu
         OpXw==
X-Forwarded-Encrypted: i=1; AHgh+RpiX2omyONBgo6rfvIFIsdLnzZuTtNj8IC+11diqP/7LTuGosD3Z9AjLV0grUTqrKOMoh4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb1j7o8RmCwEF8I7moCHdA23pJmLTcXjk+kaSuNA5OTJBVnahj
	Qs5KqvKrmBpd7kKDmoEBIlC/vNryJ1GGgyaHiP2eLbsWI3MA3+dZ62Vpi140iYNGpZ6eGZVBsYv
	hk1WkUOGtCdxMaUoH634Cy3emex0T7ss0e99dkCLhAXCG/IUpS+7xz/c=
X-Gm-Gg: AR+sD12l0xqRVk06uWZ+m98jnxx5pDMCnlKS8C6viXoTOLkiWYhqhORO3Ffsx0S6CYy
	xFX716SFElWmJ980Kb0X7RKLssGwLltrnqsNGxbxjesXvWz9cyd8iwEOD/OOC8moHtMeW2XvOa7
	93Zz+5bEoS3AeJOysAsc0uwKWFWZ+UItcliNAJahlRXKX50TunbGBwUiZKFU3YmJFvBJmqBcEcU
	f/C13LZYBTwqOF44DElZFO3QyKDiXAFIVRjMC54J5pyKybYcgH8cfkMI5UbcxU6MFkC8gGDzfIQ
	vRCfmTH4+tYn7z8eKXTM5Q8WXf4w6Iy6yT1pmGfts+ttrKZz3o8csQiB3Qk4vuq0TQAVWBwK8kv
	AQI+rroTBgKSAuGQ=
X-Received: by 2002:ac8:59c7:0:b0:51b:f25c:2896 with SMTP id d75a77b69052e-529d6fa0310mr13120381cf.11.1785232791987;
        Tue, 28 Jul 2026 02:59:51 -0700 (PDT)
X-Received: by 2002:ac8:59c7:0:b0:51b:f25c:2896 with SMTP id d75a77b69052e-529d6fa0310mr13120161cf.11.1785232791475;
        Tue, 28 Jul 2026 02:59:51 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b388d5b4sm212090015e9.3.2026.07.28.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:59:50 -0700 (PDT)
Date: Tue, 28 Jul 2026 12:59:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Frank Li <frank.li@nxp.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v16 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <2hmw6cq6e5ba4hps46k2drdutaofcqcrczjreq7hoikmobb7rm@wbconxilsxg3>
References: <20260728-csi_formatter-v16-0-1065ba47530a@oss.nxp.com>
 <20260728-csi_formatter-v16-2-1065ba47530a@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-csi_formatter-v16-2-1065ba47530a@oss.nxp.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfX0h3UsADe1MLX
 sQp2BZx4ZuLs5XoL7iMjm9xXIS9V+kDttsf+fLecn0JMC5Kb3XFPSA9wMp4q4wc85UEmHJ+aacO
 v2od038+UW/VDt7lhgqiTEK2k9yO3/S1s3wIEK05BjCutXPOrcmHkI/6owpaDlGPQrsI6422Ymk
 U58yr140yMmFTEeHANpEwtpXGfYwX9uGXhK4C4ISBAzbfiwCrHAh/iIXVm/1Auw/cAy7RPsk0Gk
 jQlDY3jByVZ/tnHFVw2/AWyMw6be3EaIqJ6HACCDKwTganme0VPUop43kcQdFLS9hDoft4MA+ah
 cBBuSyRIfQ41jMaIeuJwyMu+qciCws2d+tJOWGwy4WlapJVjnExhNQBKtko/ZuTPr+0E8LNPXWY
 Wh+clVin5TTnmT8RDokDy/hgJ/tMHGs5nA2vFf99ETGWbqMo7mXLp/yX+Db7cACF+szogYepsfj
 eW6yJci0FhgEUBAq9gw==
X-Proofpoint-ORIG-GUID: 9cTHrm_XaDy_-3kyZOhK0wS9uYtWsMZQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfXyej5BSq7Hdt/
 IY6WdenJV+LbjitqoaAVlg3SXQ0BPn2hy7b3LzaquP2AuuMror1xQhh3aXmv/qcW9oBp+i2u3ST
 oVXC7ixVw8iaZ6prL6f25X/tmpmW0/Y=
X-Proofpoint-GUID: 9cTHrm_XaDy_-3kyZOhK0wS9uYtWsMZQ
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a687d98 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=P1BnusSwAAAA:8 a=mdcQqFF6s0ROXEWFMbUA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=ST-jHhOKWsTCqRlWije3:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280086

On 26-07-28 14:14:15, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The Camera CSR contains control registers for multiple CSI formatter IPs
> at different register offsets. Each formatter is an independent hardware
> block with its own clock input and media pipeline connection.
> 
> Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
> with 'reg' property specifying the formatter's register offset within the
> CSR address space.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Mauro, please let me know if you want to take this through your tree.
