Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8AE4E020F
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658847; cv=none; b=PrmlEI8jEjkgOmj8QCLrcnKWjmpI3hTj9C2kMHYVAoG2mH4Qsrmt5D2M2S5jaP3rKElN4LSrIHUje54mgpkQH7pqMuqJANoG4P7XNGrIgP0P2IFiCcJ+JZ4Y8+Hp9fte+exMKE6Zj0fFt6U8tXprqmoRt3+FU2Q45ZzPoLCxCy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658847; c=relaxed/simple;
	bh=ORrkQdx7WaXLuX6nCR7n/UoR4xgg8OSPPnuyxEfLNUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHW5GiLBum/Wp1p/wV6VXkRlVvvc4QKq48dY0FyB4WCgau3S+amDzp8/KV616+URfTswf4ddK23AfEZSamvIp9d0eLtzHBArLhMjEyaNwwAab3oXyJ62PR+VpgwQBMrUUyegbdvYSkwYELUd1/iqYYR5Dal2/kxcE33/tjZ/68k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQ0AS78Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MRbgLrBy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQ0AS78Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MRbgLrBy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HFOXhq782584
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lOcf1R7o5InmAsKwg2E0EjTS
	IYI7yDGuX6N2Ud8ufV8=; b=MQ0AS78YiydvB/L9ivANs0HuhU7RutkgB/3kwdsG
	kMln+VSjUbSBBkbM5olq7ZRZzRo++BRaqiiaJEvyz0Akj/Hp1UHnUUiNPhcVNDSq
	pBDSU2oW7E2Qzwfg6V/uLmt5m7FsWiMArz36lg4/pTUOcg04wcln4stYkJvzbgiF
	baJAbhBtKQd1MqqD0O2f2nwVFWzvlvbm3z5RoUurE/IWD78pLrjtaHdulPd1NWwg
	m/+K+R9RONfZyvdSC6pJKvZZ+M2QdJsKFhO/3iyPqUVyd7Cyh3DcuKaYkSkTj//Z
	X6KTcpwF+lDdjZ3eULZUuIS/dgjHB6Dq53/u/7u1UaTO1g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjttr0e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:27:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91219341db7so17840796d6.1
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 08:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658834; x=1790263634; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lOcf1R7o5InmAsKwg2E0EjTSIYI7yDGuX6N2Ud8ufV8=;
        b=MRbgLrBy83Zkc7HE2cyr1/0Nzdab7ekbgRsfoePPqVCfvX6uaeS0ceec/7uef0/aoZ
         M8IhGZxMIzYnJENOwbNoF2jSFn7QX2Ql6HQIA4cq/cZ/EpOT2mRkwtyU3TkPUq6K7TpC
         qre57wzbEgVtpRtrL+fYFtbT2BZ5UxdGYh5J7mE2F+ve2RtdJkTJCSmvOKwO15tjr5yC
         r6oVEXj2TD0hqg5EEC8fW9Wk4BVh3GgXyk9vIoCsqPs/will5Q+5jmjq8pOmGyqvDiix
         BlQ0Vw49qhjKUc8SLp/qaTOYb9My++XoGHiiMpRPkJLLhHxj1VNz4yk8jSqWMh1sF8HZ
         QxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658834; x=1790263634;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lOcf1R7o5InmAsKwg2E0EjTSIYI7yDGuX6N2Ud8ufV8=;
        b=FAmP6YwPyIoV+Kt/uYqSSnOvizmf2CYW8qZfFyINltYB/XZ0c12FdXywXFnu75DMtU
         A7yCi9ASFGqfuW80vJLQQFDO6iiV/bfqdriqv5j90ujfGzxIizB/7AJVFNvKptUAJtyI
         yHjFNZb6PLUfvQbmpFX0J/LCEe5+Bb9xc0Lxfo4lwDcHVLvJxW63sxFVggL/fqLZLL5s
         CGJ67P1j7eFl5zNijiXT0K+BZR3J4nyJSHQglJxhxe3u5Y4/pZzGTJvNQAiocS3hmXjy
         CcHHu6YsYSvEGqizEx0MxCK/jtIb+hJgO4UX3knwaUOo4rdSEynt0lsWbQiA5B9OV9V2
         K+mg==
X-Forwarded-Encrypted: i=1; AKwUvBzb6gPtXL5QpP+ypv8XAakg2sJ1Wi/hrz8R9Nfw2afr/Otcq12kQpwkb0tpzLwvO4QIo4I=@lists.linux.dev
X-Gm-Message-State: AFuF++mZWT+GAZv4Xnu95I2R7qsp4B9DHLlh9kqbV72HoAdp9S2ouCx1
	7TozbYEfzeSGDMy3nKc9+Ns2oiTCg4YTA0BEg8XjJaBtizzthr9E1ObIrMytbe25dVL9snvXlcb
	fWEflWyJuO8S0rh0dWuhdQGp+WidRXGNkbr8m31VMK64hjeEhNWYiQ2c=
X-Gm-Gg: AYBFou1S2DfaTfU3kHbCh4EJgq5rz1GMNRfMmmSaLvfiQKx7zeeVevtxE5i56ejVMk8
	Xx2Jecaqjuvzu8fDxucR7pGXo01bjgWWBMXzC36Jdb+xp67BlKRLcREUnnyzcB9y7FJBT1RMi0G
	PJdxX+pBLUT0hk4IXu04Q7gbyxM9RZfnhwCC3i9WGwnfhVcRo9lDqpcRBxPTAzPZEiYscwsxOBZ
	UthLctnV9U6RFN83NWqMVF2kissx7N2eiSUloABc+NdyJKODJwEeOlfDHzIJRXRrNzDrqLYcI7L
	Cmn4PBKxh0IjRgn+c8QeizDZQZaqbgKQVeNYJ5se0aSe4wH11aSw90AMN1hAYyy9xOhEVpPfkcm
	lKkKMWc2yrzoEFHw=
X-Received: by 2002:a05:6214:62c8:b0:912:4527:7ba with SMTP id 6a1803df08f44-91252411994mr6212066d6.23.1789658833856;
        Thu, 17 Sep 2026 08:27:13 -0700 (PDT)
X-Received: by 2002:a05:6214:62c8:b0:912:4527:7ba with SMTP id 6a1803df08f44-91252411994mr6211096d6.23.1789658833203;
        Thu, 17 Sep 2026 08:27:13 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf26c8dsm16288601f8f.14.2026.09.17.08.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:27:12 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:27:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/5] arm64: dts: qcom: shikra: Add CCI definitions for
 Shikra
Message-ID: <ns6fwcvy53zd3yx237nrnbyzs2dvnp2imucgdxmj2wqi7pupsf@dkif3wniurye>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX91oA+DQo4wnh
 lYgMWy96IX3wA5Yoy/n/LzWiKMB4b1he+RzXj3/37SaZGKZZ6dvnF9gzR1XwnYR/UYr54Wyve/5
 n5fFs5KWOP/rAKIW90RbgyFeplwZwXhYIVCmkkzLVNHnbTvvbuBwQPviSd7rKsoimsWeF21gfWU
 XKxcQnvLlldiqYK5yezztA9MQseO4oGYZiHjkWOyIm+6onFxivM6VcF73c9cVKft9NLyxUKSsQQ
 DrrYHmJjuNwF+G3kIhWeWKHHmGNfvIfhmExYAnjlrQaYkOTJDxFVtjx5MoDZsP7gaHGc81Q/VE5
 b3KVycz75pAZbA08a8LXZ3ah1/UFC55egNn71W2P2pUFr+ECQ92/t+D8DGN6i/mkQ6nnwICKmw/
 TvThjucTBdtSxmwe0WJBTtL28e+iV3IVt9TwoGEutQRS8aN8XyOZxDtRvLqVud2GLIbOtljm7Hu
 Mv0rTWojlSvvpn5ooxg==
X-Proofpoint-ORIG-GUID: cerSq440ON3bg3Hw3eclLFX5OeSPz-Zd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfXxFU7SGFTU3XD
 EOg3rgq0WE3mrb2giy22QATdysgSZS6IMi4OUhrvyqxRCQGVavwFrDgbDmzpIacaKW9TuNkARx5
 ogqow2Mxu6ftNGVYH5ehvItMCf2cX9s=
X-Authority-Analysis: v=2.4 cv=IP2XmQvG c=1 sm=1 tr=0 ts=6aac06d3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kTwRDD6jQfcqJCPQX_EA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cerSq440ON3bg3Hw3eclLFX5OeSPz-Zd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170218

On 26-09-17 17:11:01, Nihal Kumar Gupta wrote:
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
