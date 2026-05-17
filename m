Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8272A2EC0B0
	for <imx@lists.linux.dev>; Sun, 17 May 2026 21:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779051788; cv=none; b=JYalPHNJgo2WVZLEWOAvHN1VtzoLG//rD6sAolEPVKC5Wb6j4dYj3f3zwu5TYf3eylPR50Q3QY1diq3NgTuyWJDhtOiYn02NZQ9SFzq0S2D16pGMaOnOdsoMPMQvqzDSBtUHepGSu0qfpYLZFEG8nDgiv0AopFfJDnhPfyO6OW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779051788; c=relaxed/simple;
	bh=NoGjoz7ljns+CMqTGt667ziDj0pK8O6jA7MO1n0+ZUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKAOZfOm3teA9ONmwqfyjJcJGBAUkZ1g0BRl+RrlHvw38HnlTRABBtB3G7kbRk+3QX7mnGkGQVR9GgRkgQI4aQGShhP3RIWIzCsKsXz/HRPhfY9kE0rHG3UYbgfSVpOWo0W+OSp5nDTWTov4604IluyAf16OBDjYCt2HgGRpq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8yoWMEM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+LYEUK3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8yoWMEM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+LYEUK3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HFv6A12884311
	for <imx@lists.linux.dev>; Sun, 17 May 2026 21:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VVSuzLLDRHb7QkGv2Hj4Tw1K
	ZRnYa7BJhMxXlF9ykEI=; b=M8yoWMEMDAISG1SGUaIJrOGqjepTyR3+P0mzvQ/i
	rxQhKUxNBhUrib+kXilfFOBdKKBe6Am1gTkH4FcPxOeR0Dhy2ldF2ici9V5M7EeG
	HgfuhJ+IE5pYepRqXXPIhyM9Sn6xb4izhSEaxyDFgckl8p1D57MqJ6oJ0wu7Hnbh
	pwBYCPJ/+awgjCRBXiDIGluErU1xR9EFs9t6raJhbQdkEdmzx/fiaGBrOWAWNESh
	VyKoA4NxLwGCbYgsKgzBYwjPy4MUySM/JMh5HkIO5VkxtX806OFsm8NaWXeRQW+k
	Y6RncfVnstTkXzKKFdSB3Z0/L1qN0CMTUfjp0i3Y715drQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7ug78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 17 May 2026 21:03:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d812c898cso46247401cf.1
        for <imx@lists.linux.dev>; Sun, 17 May 2026 14:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779051786; x=1779656586; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VVSuzLLDRHb7QkGv2Hj4Tw1KZRnYa7BJhMxXlF9ykEI=;
        b=j+LYEUK3sXfLjf6ubfdMEWvZ3bOJCH5BI6EKLvcTV73r+iHjOHC7/y3pPjI+LuaP/c
         shpiWt39I1y/Rj+fudv2uJSv9wcVTvMgmzFwucMxT6SiQxdjpxHyBfZIaJZ53GoWGG7a
         k+5zqyitizdor+VKVvUY9g/cnKud07SmRNKJecldORO0WVju71+ZeRfp+BvEKYSeGqDQ
         dG/L9NwwMFsGn8tceLX481P9B3rG7gfjG1Y3GdP2kU7Ijw9GRhpdyKE9kVMgfKe3rwNE
         FRcpNgHeRBrKrTXnP9u9Sam0cxP471L3eY3+LXQhzB/MNUIyqnWaxgp4d8Bm7qlmCJqb
         1d1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779051786; x=1779656586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVSuzLLDRHb7QkGv2Hj4Tw1KZRnYa7BJhMxXlF9ykEI=;
        b=jRxK8XQFl8YmhodoXavWiJN43Jk6NDTaWpbaAWQ8SDBcEKQhYLDZL9nI4m/lDXqtwc
         ulsW1889Yj+oGeQIeUMVDGk9J5EdavlRDAtXW50C1YHaOFy06GAT+Q4r9ijkpIhWSvND
         2jK+42gH3rnmO+ZjfjCFGPGpssDuLeoG1QPckAVDlTlPOdwxJENoFSEvbIUWQVlPYWLt
         UkwFLnczn6JgmogdYCQLAuXX4CfzKcghkHL1hNe4gemWPynRwAIU1QFMEKVi+VCKLXHC
         8m8n+rE6bW0wRXvOUsCmmF5Fx4044ls43yKMQqYAf+I8jnJSzqElVrxg9pn3Wmv3MCvT
         ab5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8UdmbJyWsqZoxUqNjuXu/TS/LGCpZnY7+oYigdXg3k97XoL6lR6Yu1TvL/4LHpjKlxmE8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlndYaiFrcPs+v3V0tXPBhVo+LphLnS/39xtViUFdPgazjbRVK
	ypD6vhkH+uIw5eFmsDjGXhJsvnXk28UDZvTQTzT/UNGsPW6e6xJI9LlG4BlSEGyCh3wUdpJXSE+
	r/oqK9Re3m+pFoFPpNQbduhjp+H1L+M9Dd7W/0Lffv6xZzcwzIiMq7uA=
X-Gm-Gg: Acq92OEP5HIzEsWsFMBU/EV7GDT1GfPOR/ajrY1cNXLTWJlI09DmxBEUcu/pbLtSlkl
	A03FaDCVFnutQd/Gbmj2v91S2XcH3s8D/pjeIuxzHqp3/6d2Omd8ZKEo3HPF5M/iivkIjLLyHKU
	Mp93w1yosMtrpX2txVXNGmB/3IOuakbTxd8djz/zZ5IuR/sif4Wrzx2yS8oAQ56INGvP/dZ1XCO
	kVBVsD8r1PbdYaakuCIk/Z7xkwBwChAIKjVgGppdEAm2HLpBzTFklcC6ajHSLGElfFKH6bE/BKC
	cdw/kPWYDN/OwrDfCknRSmCuigb1nPfCQL1yHcdUYN7h0xC6LJ1yKcEEV5snQ3FNzKdc6ORLNBR
	m9k6dHz79F2/KYjN49J8T1y/72Ou/tlwehFNnm1Rk7xJsIFY3VbeJKYSx/86WQrw+9acqEbBXSb
	4YgibA2eg7hW1H2C5Zo9Ou2ziSXpVONJOzM7EFCkR/iJPbsA==
X-Received: by 2002:ac8:7dd3:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-5165a22d156mr183972251cf.44.1779051785706;
        Sun, 17 May 2026 14:03:05 -0700 (PDT)
X-Received: by 2002:ac8:7dd3:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-5165a22d156mr183971831cf.44.1779051785286;
        Sun, 17 May 2026 14:03:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882e734fsm7520441fa.18.2026.05.17.14.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 14:03:02 -0700 (PDT)
Date: Mon, 18 May 2026 00:03:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Frank.Li@oss.nxp.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
        Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: display: simple: add avic,tm097tdh02
 panel
Message-ID: <qfyc3kuhd5qwgtbbvhix5upyfcn5s26vty2yrnkzun7vuujgco@44itayac2pfe>
References: <20260515195935.2415466-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515195935.2415466-1-Frank.Li@oss.nxp.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIyNyBTYWx0ZWRfX3vbFI2owBr//
 81eaMUFdslnNLBhMolORAq4l44PVzu1pQriQ77110EEJRRPLzP1G7LAmZQX/p+UT0NHu9L5BSd9
 5Be6dDM9CAJWYZH0rmtyrWovR1mWFApn/FVYsIZBhe15cu4buCdaiPG0fxoT5+/Ut5PwW9I1sgv
 qujLChMElJXHx0FCSaNWJpGXskZt4OSyfUQQp/1+ygO0XIoRWp3Bn3uGBlyxYiuDR+QqQIvE7/d
 q+TMVHfmXWlG6SrfUav7sF/e0k/K/7iMyIq4AhQZIkqIy0OsHzUZjUA8zVbSZF8xqM6g1qjg6ef
 hRVVR9MHvWa8JtSdwypvQh2LmQyTMaTedWTAfVs7tRCe7ENJYHKrIusO/5E0a3jqYBJVWWMxAk6
 0+jOcNQaO54BW66YIdOUgDNh5LHqErL2BRPYPkHM33WVPoxAKWqstS8XhqR7fRl/JMMA2KZz4bz
 bkQehMYzYqAD/BN8dGw==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0a2d0a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=8AirrxEcAAAA:8
 a=402Ol7Zq4xy1YCkJ2sQA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: oeN-p-N27edFIEeD2gP9NLg8Opx8aeio
X-Proofpoint-GUID: oeN-p-N27edFIEeD2gP9NLg8Opx8aeio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170227

On Fri, May 15, 2026 at 03:59:34PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add compatilbe string avic,tm097tdh02 for AVIC Optoelectronics 9.7".
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index fdf522a15d2ea..a8f057208e23d 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -63,6 +63,8 @@ properties:
>        - auo,p320hvn03
>          # Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
>        - avic,tm070ddh03
> +        # Shanghai AVIC Optoelectronics 9.7" 1024x600 color TFT-LCD panel
> +      - avic,tm097tdh02

Not without the corresponding driver changes.

>          # BOE AV101HDT-a10 10.1" 1280x720 LVDS panel
>        - boe,av101hdt-a10
>          # BOE BP082WX1-100 8.2" WXGA (1280x800) LVDS panel
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
