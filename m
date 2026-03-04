Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1863DBD6F
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 19:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772652668; cv=none; b=qiRZCM+6EoW9Qq6GZ7pO7e3Ys+2F9CC1w72vBsx4GYSSdFi+bgDaKFsB7329FA0JJCmaq9rVJA49YH5/jHQaKe0Ui0h/9AD9Mbix0Urjih/PzYW4rhVR8vq4XzqWZZNZJ5wbi67wz1C7we+VJ3lRWsWbnr9l3jUkzb3cNrXKx1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772652668; c=relaxed/simple;
	bh=BjQN/cMf0T0DG1I/pwW0EAEy4bY4mFUT1E3UZGvt8GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwIP6oSkqwPRdstiy47GbCciK4IicQksNHreMe9CZbnMsYFFBTUMSuoQtKUQf8mnQWUUoPWiGNiuXaBqxb3cCCSKLtYIOmKP04+po3hwgiq3LHR21hCDdflVflMAlHtiwYQgzKzvwxlcSIqIufQRIY8FAKXZwWVLhbCbmmXoWe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6/0HCT1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RUuFyKV/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6/0HCT1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RUuFyKV/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHmvS2612022
	for <imx@lists.linux.dev>; Wed, 4 Mar 2026 19:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5Jaor1i7AaHnrlCUBtuu5yj9
	CDGjIA3h33PiPiPYpNA=; b=B6/0HCT1giHCu1qilIWaWxAGL9TVYR0aaiE8GJJv
	X3unB+slTHqqyJMag90tMNq2NMIe/X84h0BnqSD/dn47/hj9+OQIw0wcxrCP4CNK
	SpvEY06u4k3LJ5ppxCuwTAgOz+PD6aEOA7LPF+AvQu052mlH+DGwRlzwzrsSM5s/
	Jm+GZ90PNC2xXCh1NLnT106oph24aku6pZ3UHMvhYEiKecQS79i/Z68BvWqBH5Kl
	JiaKT44IB+SE4sGNDIB5hzuiR8iQmgEVpmhAk5cHW5DPgNcOa2ShChFbiyLLinoa
	M+XaMFfArLhc7y2Re8ZwPKTW0UST3hRoxKhRLRrfBQO6Ig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0w8d5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 04 Mar 2026 19:31:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c881d0c617so4205625785a.1
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 11:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772652665; x=1773257465; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Jaor1i7AaHnrlCUBtuu5yj9CDGjIA3h33PiPiPYpNA=;
        b=RUuFyKV/hlzcz3s/lYsJtgZFD40KytNfGGsAKXgv+sOlGquWtak8OEgmygtvdWab5N
         LQeDEfnz3D1Ie73VTt/Thlrf6JD7JZNsXcNBrOidAfLeyxh1lCiSTIY6nvn5G7asvbaL
         LyJweP1zc/OwdEobHovVlGRADLrnlDUAm+lv0pwruHRjxjERkW5NkHQd2l9z4CAu3HXl
         /zYDnjO/TM3EF+cvzY5YpFilF4IEZtaUrRww0Rs4CvdVxYMiJkcJBmS0TQziGpioPzQa
         bEb1UQvj2NRlnXCjT6YeV0YRjEmRnlUBBD141qyXP0QSN18rqQXAe0bUuY0PgOOSWD82
         VYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652665; x=1773257465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Jaor1i7AaHnrlCUBtuu5yj9CDGjIA3h33PiPiPYpNA=;
        b=Y6BNs2DICqaD53UvnX0Q7wv2i6nlE2WnX4dtR5nCMlqMqx6I0E1GoltV4M/Jl1WUXc
         ycS2U+DWl7SIzUFr18pBkSRAfz7DudtV++lvy9JRgCAh2kVbggSAWsjLOmyT5YMNIl8K
         0liqMPXLITxDXZrCqfv3YkCPFbBZt/DXlW1StcnIWPDm9KarWk6KIy4lj9D6jOL8iKoY
         kGR5sB6JxXIpXrdwILR0OHVvtKUbM0BOwMVSfObjp9oSSKWuL7ot9+ZCZanwNkFpAmd+
         JZkRjmbXd39v5ZboKgImLD76myeAF6nYlMWXwvh7s1YJuunXUOc1EAuAqU6bok49i7u1
         kW0A==
X-Forwarded-Encrypted: i=1; AJvYcCWkxpHhPcW7D76BYjKJZIx2eyJ4T5JJWr3rVK6CCoJdBB7Q6JpMZXr3+JwHBTVpFxkzIfk=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx/OJ+vxPX+yqaXKOCvX6+SA28lSSlnxhgkGL2V+4hzGNam9BK
	We038oWKTsEdZlgN9W4pondwQ2jdccMDuArP9AmfgSJMmLvUwhI8XiXr6chou42DpX1CkzbSSWM
	aOetRaQ64mk+Yq+vvOXtYo4xLMHqW89DVqOC35kkppvdVp7oirfAoueY=
X-Gm-Gg: ATEYQzxwKax6Ig2Vaczn8qwhD4rEwHJvFzRCiaKGibrGTyzBpSo3xfZJjx6i72dFC49
	y1UHdPYGJWWEUyKg9P3xvQTdACTMMPFq8tB+/7nadII990tfbT3XLJZx3KSl0V+/XXm9x72CjCW
	Swg0tr0/aXxShCnigaNRWaVcZk7ZGFsqgOK83PPVKVuXzm9IhMmULXtNEa3uVsb4S3Os1uIm9cU
	sfAW1JeYYqaVGkX0G+vvDxhn+h5K40DIJZd9GToFiuMryXi/ZNHeUyw/znGX8zPn2bhgHR2G0zk
	O35RUs4RybDjWIUDBCJPWzx6CmjbYf+fi2qPFVCOHSDGrB/0uOsuUtekez6LKHkZAyWbcNkOSQc
	kTL0yDK4KbQTCj4NYNpMkr+DO9gcX
X-Received: by 2002:a05:620a:3722:b0:8c7:b5b:cea7 with SMTP id af79cd13be357-8cd5aec67d7mr408390885a.12.1772652665616;
        Wed, 04 Mar 2026 11:31:05 -0800 (PST)
X-Received: by 2002:a05:620a:3722:b0:8c7:b5b:cea7 with SMTP id af79cd13be357-8cd5aec67d7mr408386285a.12.1772652665180;
        Wed, 04 Mar 2026 11:31:05 -0800 (PST)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:ee0b:246c:2dae:77b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a82dac3sm43124135e9.0.2026.03.04.11.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:31:04 -0800 (PST)
Date: Wed, 4 Mar 2026 20:31:01 +0100
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/1] dt-bindings: timer: fsl,imxgpt: add compatible
 string fsl,imx25-epit
Message-ID: <aaiIdS0zRPBY81aE@mai.linaro.org>
References: <20260211214947.3705328-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211214947.3705328-1-Frank.Li@nxp.com>
X-Proofpoint-GUID: THZ38bd7qXxymimC1EbqxkhceOGMijJU
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a8887a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=8AirrxEcAAAA:8
 a=VlEfjGrzG_qnfxHD3IEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE1OSBTYWx0ZWRfX+OvcDhhxICsr
 fZrGmE4fI4YdSAsIFytrfFWkQh52IQujpEAahh/x1qp1I2cMbL37EPoe42+93tp3rNLdFNgCtW9
 e8p1HblqdHkfRdMqlzLwDiOOi8DHOtnazKUK3STFnHSp7KpoalYIixYzAFd4f19M1nHfvbHiUpg
 PXu3aVpfDdgia9q6UEX48ztuylVeVHFyDVDs8HKMFwTeQev6z+h3N1aGP6vx1xC/NbBEWwlfuZU
 SXiP6tJ7rvT2QfZ6Z4Ckvk4WG8EiJhRQYtfR2zwRU5X9ti3nCRBtwT3eRgOg45Acm1SpyRWu9pf
 OKVo21qrbwq4hhOsUXrXq2FMYdLkjkmKaF7y6498hjqCnSblgNj9XTPNVzVoWfXoAmfKBb2zbx6
 BC1EP4Pvl0s+bWMWVyGk6WnIB3nTy/1OkvN73riQS5RVE7eCyP3CokCdmRfW6J7kLrhiK+fzLY0
 cLis4XBIKxztWnft2gg==
X-Proofpoint-ORIG-GUID: THZ38bd7qXxymimC1EbqxkhceOGMijJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040159

On Wed, Feb 11, 2026 at 04:49:47PM -0500, Frank Li wrote:
> Add compatible string fsl,imx25-epit to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks

> ---
>  Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> index 9898dc7ea97be..6d41fb1203793 100644
> --- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> +++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> @@ -14,6 +14,7 @@ properties:
>      oneOf:
>        - const: fsl,imx1-gpt
>        - const: fsl,imx21-gpt
> +      - const: fsl,imx25-epit
>        - items:
>            - const: fsl,imx27-gpt
>            - const: fsl,imx21-gpt
> -- 
> 2.43.0
> 

-- 
