Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09347263F5E
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 18:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759257826; cv=none; b=ajlYzD2jxV9ILaW3w9k+E6K9+myXigVnDuOPesJjAlQR6aKyhyhl/DhpqlAmLWGT6g81QHKvrvSX4qp4nNb7qbnvYdzB/iq62MtjJxDed/dmiFLv3ogdJSH1ZKwy1QViDGlrc+A5i1IznmF54351T+vEHo+wxUo8u58PJQNelaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759257826; c=relaxed/simple;
	bh=FjCaxSo0gdGhvu7zeLMnYLhnP7QBFHb9v99tTue3MwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYwkijIsTsQzlq3xvQtDBEhnHLT4ZYAdiVIVht0b6FjJKxTZ7CuG/wDkJk7pp+uh/fQZWLYfxsKDfjLPK3BDPQD14TTCZxNXLsbMS3Hv4wzRz8/9rOmJxMjNluY2gmZvVhsK1OmMKuMAWTH6UsQb++B+/D79JyCCwW0jnDdEW6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfTmvrZJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfTmvrZJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBUsA4010706
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 18:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yGmiFBtk8zoxCM+T4HUw6+ZD
	+jra215LvynAxpP5vgk=; b=bfTmvrZJra+/oQZi7uhdBmbERNSFcTLqisqpazM1
	wiudlbDafBQKYQ6pepOJctTKpmrQZLScq2Ie2N7USskXBRMWD61lwlErIgXOMJN1
	qmq79ohKTxUDoPGobDLWT5bGi+/L34X/W9bxBGDsNwKUp93UaBDrvGqMjJxwddVv
	twZAAp/AyQzDTi9fCjHWxV2d2jpJzcZmPHSum5dzsj1p5zNaGphdjbtvdj3uGbsl
	syJVbQRAxIaMzySx/jd27fn8v+vpXiG3HM7OTe6rWRUwrdTQbojn/tGpr7OocZTK
	QsbqQ25r2ltFmYQHFm4C318tKfN+YNZeJSWJg4psEJRt3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mctfc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 18:43:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8589058c59bso1919809285a.2
        for <imx@lists.linux.dev>; Tue, 30 Sep 2025 11:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759257822; x=1759862622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGmiFBtk8zoxCM+T4HUw6+ZD+jra215LvynAxpP5vgk=;
        b=aZxhizDoj/S04O+h8pOHc2EH3jNrsSjAzr6sWUM+bcn/Wc4T6XKafioqqivTsCacc8
         WUc2hgILnVw0NireWHaqd/zOKIhIedGMPLb5/U1k7n943yyFRZQb/ekQhf2do2pwKCkF
         1be20cC4eBffxyiMpaOhKPdXrsmviZVbEAaxBWOam3E4T5k5JXr70f5Crc4gWrS2hbk4
         vXovXe05n4J67JDRK2nApPLlyAtSIBmnHb7KQnEzjVfCrLLaTTmsgVeglsQiONd6i4bZ
         wLA5PAHAuK9s/n5WsCWIBFikiR2GPsiwHx6LNqUev1djs4ZH9B5HSgo8z9Zelkqt48PB
         jtuw==
X-Forwarded-Encrypted: i=1; AJvYcCXOH/zvJ66bBeGt76FGxUbcj4Yq1CM0nqMFXIT6+/3RtqweCjz66iTTS6G/pophoAxWKW8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgXDrQxKeNwnuiZ2kuMEn/qsjbkROJwlFOqbJWt7HD6bsS+VbE
	l8wCDDb47JFtOHX3sWAaf+t41gx5RTb/jPrD3pq2CnIc15A3xMuImOBrvyVslo3NNypJD+qPzJW
	EETaIn1YIpkGvH9cXf4eXVY4zjtcoLFJHy+S1/CAd5ce63jeZjtoTI+c=
X-Gm-Gg: ASbGncu+Ed2f1zOT4Fn7B+ycihfdD+niPTTiH4gd+OxXL7jFThxUpve2MvdTXUjyJ5T
	ffgP0gbNJIpeciRwAlSSXN4jkleTfbkgGXoIpSIm8mDJbl1OEHlbEWWc7GNV6wR291L8HBni62s
	jTjhNnNkTlzd2eDE60eK9wmgPGN2idQAXObhiKXNpzPzENfNEXrhIS4pqH+QN+Q4Bj672/H+FEv
	MTAHi2PJLBx//7+rHXE42edqcu1e6eK616Z2JBegSmzsE2dD6uX7DZ1VyFWVIo7/zMF08nJGy4r
	j2l86wPtW2gFVpTQIFSSJPJA5OrX87sPfsx0kLNmxm4T3Hcvgdj26rlNnM4yBJk7Qkp1s85PTED
	7wdFbqyRQGdlfLHUsGo6hcXUvCpkmHJ+0w9ufJqVk8FD8IxdQcJIrS6vlcQ==
X-Received: by 2002:a05:622a:2c9:b0:4b6:38f8:4edf with SMTP id d75a77b69052e-4e41ca1b2d1mr8343121cf.29.1759257821833;
        Tue, 30 Sep 2025 11:43:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVoTpyYZEYD5BDhL/ibzffyH63whEH/5BJy4dUuRPx4WpG/DtAm/AZa0wD/E68tizX2uBZjA==
X-Received: by 2002:a05:622a:2c9:b0:4b6:38f8:4edf with SMTP id d75a77b69052e-4e41ca1b2d1mr8342591cf.29.1759257821234;
        Tue, 30 Sep 2025 11:43:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665791esm5232132e87.82.2025.09.30.11.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 11:43:39 -0700 (PDT)
Date: Tue, 30 Sep 2025 21:43:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Romain Gantois <romain.gantois@bootlin.com>, Li Jun <jun.li@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: switch: split out ports definition
Message-ID: <vwlshz5li23xlthn5delxwxdsdci5nc22iey3xih4qf5uhbory@clskdsy64xpx>
References: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68dc24df cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=OOCT3r6X_P3o6Jl0E7UA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: aVynLL0p2nQzfAKw9QzmZWhjdV0-Daew
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfXyKm7qtuWcMX4
 k3AFm+livSsNFId2BciCzi3AKmiOvxWj7DnDYU6o1cA/KnpTWB4EM7TfjazRVv/xFdrrCyhT5Bx
 2GOF0eKKaqB3uR2g5cYkYYOUk7Z25tEwf/5+vYsmudTIjFBvMoPwvFWMy2a70FzpoNhaV+FHklj
 0nyntu4yPHJN6F/Rzs+b4612xkmNaZj3Bi2RovkDVXpFEpWMnqtrm+w26UDdRypnYHohL2fmiFK
 Sz8QIsLDScRXcZ18unSl+5A7XI+ttcXS5LI218e60AZBM5xK/newwAtSSzMZfv3ZftkS4BwanVE
 RTMI16ayBtaLANxWU+RH78Meh2jJ6Wx0PS36LWGhn5PCQEfRMazHrEEowqpPOm6B28VkKgBq2ME
 KMLbF6/4aqdCEb4dttqgJShAiD2Arw==
X-Proofpoint-GUID: aVynLL0p2nQzfAKw9QzmZWhjdV0-Daew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004

On Tue, Sep 30, 2025 at 07:17:21PM +0200, Neil Armstrong wrote:
> The ports definition currently defined in the usb-switch.yaml
> fits standards devices which are either recipient of altmode
> muxing and orientation switching events or an element of the
> USB Super Speed data lanes.
> 
> This doesn't necessarely fit combo PHYs like the Qualcomm
> USB3/DP Combo which has a different ports representation.
> 
> Move the ports definition to a separate usb-switch-ports.yaml
> and reference it next to the usb-switch.yaml, except for
> the Qualcomm USB3/DP Combo PHY bindings.

Isn't it easier to make QMP PHY use $ref for port nodes instead of allOf
and keep ports definitions inside the usb-switch schema?

> 
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/all/175462129176.394940.16810637795278334342.robh@kernel.org/
> Fixes: 3bad7fe22796 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/phy/fsl,imx8mq-usb-phy.yaml           |  4 +-
>  .../bindings/phy/samsung,usb3-drd-phy.yaml         |  4 +-
>  .../devicetree/bindings/usb/fcs,fsa4480.yaml       |  1 +
>  .../devicetree/bindings/usb/gpio-sbu-mux.yaml      |  1 +
>  .../devicetree/bindings/usb/nxp,ptn36502.yaml      |  1 +
>  .../devicetree/bindings/usb/onnn,nb7vpq904m.yaml   |  1 +
>  .../devicetree/bindings/usb/parade,ps8830.yaml     |  1 +
>  .../bindings/usb/qcom,wcd939x-usbss.yaml           |  1 +
>  .../devicetree/bindings/usb/ti,tusb1046.yaml       |  1 +
>  .../devicetree/bindings/usb/usb-switch-ports.yaml  | 68 ++++++++++++++++++++++
>  .../devicetree/bindings/usb/usb-switch.yaml        | 52 -----------------
>  11 files changed, 81 insertions(+), 54 deletions(-)
> 

-- 
With best wishes
Dmitry
