Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F256C29BDB5
	for <imx@lists.linux.dev>; Sat, 17 Oct 2026 16:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255930; cv=none; b=PpIVWBskBTRXwTnQtfxrokKjmuarDA5jr5upnyZEgdjAKNE3izBW5hZkLrmeH2THTMtWu2NqPJMrJkhp442uPdnEydUMytLsnlLT0CHKaH4LBp5lUrgqXWKzG0SAkCDXJgbNyAi+nO2769zM9hqJV0RDeYBsGIvxCo7uGiulzSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255930; c=relaxed/simple;
	bh=hsHiEZ0MfrTq0vKlHAdbOE/dq47CUmz0Fx7H3gCkV18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axijNbJYrv3wcY+0tNGAQf6rNKAL8IiZRnhOSqsKzkU49le0qxD+XhU4sO/Im+nzvBqTkBGjhbVstHdu+VseYW2qcnUiLpg57RpScX3+UapYis7huu5cldqwGBOZUWrA/4jwZcENXWzkvOtGYZvSjMsregxrDhIRbXvt2p5Ea2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddkdEhfx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UezHbwVP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddkdEhfx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UezHbwVP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGBXeW022706
	for <imx@lists.linux.dev>; Sat, 17 Oct 2026 16:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YwGr/VFcVBThPZuxD7wslr2Y
	PtoE5+81Oolo9GzuWu8=; b=ddkdEhfxlYdg0WsHZwg9YM05OnoCCx+IZFh7CpvA
	fZM4QzivJbpNpTR3Qtvrat7NqSk6ZsAwVBAwG3CoBTtAjfQGMNpWcuQ268iZAdGt
	b60a9SGpXkDLJ6ph+xnqDDr9mh0at3I1KPAALHtr+svlkjG7/Nu0r9dSvr1TPFdT
	ASyOqglJ2l2IcfKTLLF/bBQqY7QXhXz2vgiuIIoH98GsX7hItE+yHIikqJ9+b0XE
	900wrUHa54nqfofviVcxz0LDmr5v/J2R/i8OjdfSzkD3oOKAXZspDdj/WuXU8KkI
	nVOP8wkXAUnOP9wrXm5HU6qi64684cL5vBonmhbOSiPozg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k1801-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 17 Oct 2026 16:52:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so1364004eec.1
        for <imx@lists.linux.dev>; Sat, 17 Oct 2026 09:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255927; x=1792860727; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YwGr/VFcVBThPZuxD7wslr2YPtoE5+81Oolo9GzuWu8=;
        b=UezHbwVPC1DwUG2DKV4T28hzjs/ShksHyzyKKQTOsvBa3QLWzcbLj1SilfJj4zD45i
         7K4j7DdnwLmH2eY8RoGWVX5P+qta/ENM2OH/p7c0I3N+k01GKe4GCrVfwNeqUWR2mmMB
         8BT3aF0HR9evolrmygIfHUK0CjaEXUyvQijyVCKfU7jSrUeSMzkYPrmcQNl8XAl02aOF
         6EdqzaxiF5zGbLS87Chh56uS9AKyGZp2a6tq6oKekRd1KtyK7XLX0ktSZ777s8zyqqaP
         PAOVxWZNeb1YSYsf8adKuZlDv6gVwfcWG7FAOryalxZW+OEAXsqEWTsg6dJ2U/Euxq/R
         zCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255927; x=1792860727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwGr/VFcVBThPZuxD7wslr2YPtoE5+81Oolo9GzuWu8=;
        b=1d/3WBzgjihBO0+jfdTABptqif9dmHDKPwhSfdWRPhb7OAxPPIg8GzGlyHyuscF0DP
         x4Mav1yuLHMk/+TW5L3jupyx2XN/ZW4BZMvhtwwpUc9ePSI3KDjkKlkEWR79+tsD/tQ8
         c9mZdvnE7m8JUW/0Vy+nqa53vEzogX4KhYKZ9ZuaQ0HSEjoo+SGRXvuEOTP3JO5UiotW
         OyIz9b/Cenn56pUis//3fNVoFQ+rtg0dGHbwx+r/sHNa4sMYcomsxCFwilU3x/ZZEVbi
         DRECdIVQixqMkdxxFG2+RtsPWBQ3TeEVChWLhYFep4tAv8y36aLHrm7ItSx8VCFLE/yt
         RtYA==
X-Forwarded-Encrypted: i=1; AKwUvBxr7te4aCRtnmz7ZWHm74RG7Snd+npFw5snSavcF/mivcYSvW1I1Emrhcw7TTcoz8LQTDQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYKjVLdChLMXY02iyTaUiUKwq8B9PnkRj5O4Ku/MRY+DLqTyFqNb
	/ZjMRnTkT967IDlC2zftflUSlt3t4ciW+HUija3kMUc5lrIPM12yCf8mzRchajhoW3iBNxK+fVq
	Cr27Ktcz+jgwy0q0pjMOzJkNYQCdjfrvo0VW3Ch3wLdtKl0EP7O/MwiM=
X-Gm-Gg: AYBFou2qsteLhno3X/rJ4udufnW4g2kVz59OZ/Ad3bLy7agjs2HrHYRM6HmFKo7O0ie
	fOFSccHyrhycKzKiJX2SUhYHfc+sCg7Ak1EfPl26ugD7VutExC3Q2+kQFk46S7wdQJjWfzG6UVo
	qRsaBeFuczzRqolSq1rmBAnhrwsvt4DXxu30//6C61XrZ+0a1WKeaqt7oBpBd0LYlM6X+/58KWH
	mhDTnHiiJpLjYwojB+hV8wq1S7c1MAKSbVrtFEUXSFWpXz2d/5+Y58n39/cF3o+mffE+kw27XKn
	frHm628r2EUqTAWeJO9A57aML07S0bk+clNPIHhtIjuXXumH4afdc8MHxH4H/3Ue5J4/wEWJcsO
	2+4zL0h88NpPT
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-361a2c38d17mr4246710eec.33.1792255927224;
        Sat, 17 Oct 2026 09:52:07 -0700 (PDT)
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-361a2c38d17mr4246646eec.33.1792255926579;
        Sat, 17 Oct 2026 09:52:06 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm16487376eec.9.2026.10.17.09.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:52:06 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:21:50 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v16 6/7] net: stmmac: qcom-ethqos: factor out
 linux-level setup into a separate function
Message-ID: <atOnpkct5QYK9VW1@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-6-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-6-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NyBTYWx0ZWRfX/6gDcUQHW7VQ
 dHH4hqqAqpb9FyHtJPGN2Tq0dvb788XlJ73hhPCD44AIcCVWrCeg1BG7d1ONfvhczkhfE/1Pd7b
 y28DA8m5/unagpcnY4o9Ooa4vDD+aiAKTlQ83KW8wVhqE7NdbaMyoFU4cHJJFETF9W1ksYNM2OF
 pdBtOgSTfVn8XjGrRXTL3zfoPDcDU+PNQc0n+W6cQU99yVNHTljPwN0PUSpsvclOKL/oIoEBZoW
 72wV9Nbfv5kznGKQR+jDVqwZ+Ic5rcYiIK4ohTpif1grry09R0RkqJONWA0Y1EhA4JkZPA6tU91
 CmjwDpvLMrmx8U3jWgwGNuia3zz7S3XROmBW9ZH11X67XUtei+Bq2cpZysTSvCc88cEQwG5X+/e
 P20cnwP3KKCcctWHXo6pprAfPN58ftXsd7xoddLDucoB5VUpPrGQsruUqZskgzhog/zOkkBRVwE
 2ZZ9IbuiQf51439mNzg==
X-Proofpoint-GUID: 8zVyWnVnXN0C2chDIFhr3FAPJdiKQRiu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NyBTYWx0ZWRfX4JO6ygedouFT
 ZtOq2UCKoyp0MPvT0ZW/ugKCRfsBe3D+ZGcchV7oAghUaEHEIKZTvLa2H4/J7dC7pN+/RTwdfRi
 Cz9Lu4C9cFBb8w2qHNspnlW9HnrtUVo=
X-Proofpoint-ORIG-GUID: 8zVyWnVnXN0C2chDIFhr3FAPJdiKQRiu
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad3a7b8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rqvSfYwyKISaz1XZPbMA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170067

On Wed, Oct 14, 2026 at 02:36:45PM +0200, Bartosz Golaszewski wrote:
> Ahead of adding support for firmware-controlled EMAC variants, extend
> the ethqos_emac_driver_data structure with a setup() callback, implement
> it for the existing models and move all operations not required in SCMI
> mode into it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

