Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959603AEF21
	for <imx@lists.linux.dev>; Sat, 17 Oct 2026 16:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255173; cv=none; b=e6Pst/WjpOdzCSgCSRHlx3NDuqha4JhuSiWcsKBzuSOnnP+dAY7JUlx9Lmjlfp84ZthvhiKnBoa/yvjgwAiFzGt1rsob2QelIyDOqvoIF8GVgvFlUhDYtEp6O5lZK+yw+00XjRCwWr4bxICZ9w7kQyjp2+fb5HDn1Ot70da/ExI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255173; c=relaxed/simple;
	bh=VjJXPVvJ28GFo5oaYh5V0N4OmfzYXgOo11M2D9Ou1Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzRoQbFPOsBd4DimIv+qjdL0BsoOG0bVNFqQc7loUH6PQSYm3TgwoY39eQqF0a8IlmY0+lmVFjYf/NwjgvaMNvKpg06/ZDR+/lFKOo9h2c1Q4PJhfYO/aPYMV7w4zP+LJp6JxEbEpsy9teGJO/3xvYBac8HVu3ExLQ7ktQtyXsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqcI3njC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HErIJawx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqcI3njC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HErIJawx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGAEhR1179625
	for <imx@lists.linux.dev>; Sat, 17 Oct 2026 16:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hz4iIDuDhHEcy2mIuGeKuord
	9GLsrFZT6JV2X218PUA=; b=iqcI3njCDzM4e7mRHLw+YV3xmeKx13qdpNpYLO1c
	uKuJcnhcRz3rtqo+XqDGeMCZv2dURNY8sE4Up/wSPorj21shN+H4P4PvOUiE1k4f
	HrKJsV+TXCcL1K6rMrtrXUEtT4Vlu4w4TsY7ngl01CsdTZz1rKlYemGVmnu3eNHV
	+HjThJ6ViFeCJyAVpyHQYmZUV+RGbosOkNtCwmXNHB6OUn0sulMIxvCNKMz7qg71
	VvhPs8OoWfwTc1Wwi9VbA8nr0EEah65QxY+qlhZZrIAZfY7QJDXrV6PujpiUFd11
	LA1oKqK2zNAXkDqjMldYzsbUJ7V6A2GAOrlTldaC5GhPdA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bghdw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 17 Oct 2026 16:39:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35d4538fd74so2936059eec.1
        for <imx@lists.linux.dev>; Sat, 17 Oct 2026 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255170; x=1792859970; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=HErIJawxF5lJ0QwREIG21d5ruyH1jYT/J+TC7ErmLVmAUiG+BZ6dKxlH8j6DqilzAg
         jg3RQ25xvauatTKojuuRjJtZa/NUPdMHOgiNF2kz5XbDlzLVgD5g/RHNYG11qS4NHSdc
         Ol+9nskt/Oyqgvjwg+Ozygrx9+xx9fBLZXqFbvTu84v7hyDnxTMjTEdmKRkpf1QOAsmu
         o3niBiKUbO5bYSykvq55H4sg8IpfcFiehxuySdlb9xtjd1/o0NOB2FpjFT2ZY+90CXdA
         hCn/nSvwrLi341GxoBWkRvxDBePphPF8M5LIjqHa9cvXNkhjL3ssvxe1LN6xbcgLKlif
         RFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255170; x=1792859970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=VP4YS+q3HNsjI8Ud8pMnvCNhlZaYes4xr4kQX/0V5Rsh+kk2BUw08JwGAUUlxIJesg
         jag3wPn+S2JZXb8xE5iHULqJoEMnBAY278/ZvhBgju5OdGnp4c6pXqjxO2p1YDvL6E5k
         np2Pkd7Akzt2ul2O5aems+pCjtfRT4EKgAPtR2YHNWQPjfe3A7JpOcwY4uoAlvE6dILt
         0g0zpSXZ5lvvvLVNFviL4iUItWGNhbvwQz/U0mVZXdkzUYmisnuFh486O5vJJV1kp1Dh
         bHq2XmlOWNznxFr7AddRZpTjELMOpslvfpZaSqX7qdMdwC13k9LgR4bpJeLNYga83cwG
         22sA==
X-Forwarded-Encrypted: i=1; AKwUvBxVItuvWkPmvQDipOE4PsC15ldFdVaP6IdTKalPkiIqmeMhMNgObVXpQMDuRO8q4e3ClIY=@lists.linux.dev
X-Gm-Message-State: AFq9FYIgbm9bLdOIZH8PM4RM+KJpFCDerlQoxPUbIE93aphZfpCQBQwX
	QtSNRidQuW3uHZXPJQQ61DMVzWRAT9/B55y1+DT8DKXCVuF86/TRiXnOb9vaoIpc5GrmlHa5Msr
	KHxSQAMdQC0MinZFYsYrcGLkRK5BsGdGK1PgWFRuUG+fbu3tQ/5l8qDQ=
X-Gm-Gg: AYBFou1+A0KOShdzTOZx60LBcR9J+bt5OoftL8kB2KqVvquWgvZnMBydC2kz22bAWir
	KB6vhXaPHeFOMs4cS3/+bsq+1voffOTmFAKG4fl8zehsMFNB7/zk++bHAnKREh+tArr2wI000Ig
	0uI1P7I8rpaMaT8jSDB/fIhtTVxFAg9LqW8OxzGwqLh6u46zK/lSdpBmPZbGWZsMXQLmnVMDoog
	1R/s6FEP6CjQi6gqEWL3aGiOtcw3ZY4sYlsFAwonqnAtBO4O9WQDeEkbHqk7OT+AD6NGYqy07Of
	ys5PMfyCtsmij/ezjre5FS9dxcG8qGUe++CiN4roWEf2vMIS74HvBGIvmJH5P7uB5MJIftfkpxn
	DeONUEarayDsu
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4630090eec.32.1792255169746;
        Sat, 17 Oct 2026 09:39:29 -0700 (PDT)
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629905eec.32.1792255166648;
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17691508eec.7.2026.10.17.09.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:09:10 +0530
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
Subject: Re: [PATCH net-next v16 4/7] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
Message-ID: <atOkrubiz/V7aFiu@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXyahv9Cp88xNV
 D2fKWAG3HrTC04EIxUgOByzzge/h8HOHpKPiNd9b+k1IM2beFPSVXdJVFHc3QF/a96I0iGTCsbm
 OgzOfhzo5SIuJ07qGd4QGSbtm2bGJsQ=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad3a4c2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=K33ZUWoUxhUzfzW7EYwA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXzRb2R+Q0smZk
 Tkd+Wf3mmTSm6VTkL/wwiddLmAj4lWa0WZCs/oAfrKodbmHbxl6cCJjUUqJPyJYNp40IN1Iz7eB
 wn1NCLnhx1JMGqkUPU5frmfCBqBUfKFy2/foRMcRkZ15iVe3o9LMzYUoGF3YmwJY2WZelxP9FcI
 pGs8LsQvyFGd2s1vfUKm/bZGHJXqpkbYY8Vklz3n00Om90ttxa00k6ecZtaC/wz53RP2+Ielk7V
 atyVrgloR8TflOFHM/ARLzxTXLDUpZaWZO1b8Scagx0yD041/T3QEggmPShM7+PWioANSxgwK4x
 OWJZblsVkC0yh6Td0R+0NZGz2eR2LRtxwEfT8w19z3OxJf6ZRukVaxYkag5WqnWdVzdUkR1K1cA
 OAyZFJ8KS06SzZA5PwTAmwcdH2LKfSm02wVhNIBo5C6aZw4D+PlNQR4Ms1B75aNg7KfqMRGKNDL
 onyexTac3yfUhAqmyOg==
X-Proofpoint-ORIG-GUID: hb5CXng2lAnC6wj4z0KRbWwMqUm0KJY8
X-Proofpoint-GUID: hb5CXng2lAnC6wj4z0KRbWwMqUm0KJY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170066

On Wed, Oct 14, 2026 at 02:36:43PM +0200, Bartosz Golaszewski wrote:
> ethqos->phy_mode is read by serdes_powerup() and
> qcom_ethqos_set_sgmii_loopback() to configure the SerDes and its
> wrapper for the correct interface. It is set once at probe from the DT
> phy-mode property and never updated.
> 
> phylink resolves the actual runtime interface and passes it to the
> mac_finish() callback. On platforms that only ever operate at one speed
> these two values are always the same, but when the interface changes
> at runtime - for example switching between SGMII and 2500BASE-X - the
> stored value becomes stale. The next serdes_powerup() call, on
> a subsequent link cycle, then reinitializes the SerDes to the wrong mode.
> 
> Update ethqos->phy_mode from the interface argument in
> ethqos_mac_finish_serdes() so that it always reflects the last
> resolved interface.
> 
> With that, we now update the phy_mode to the runtime-resolved interface,
> so any subsequent resume with a 1G SGMII link skips the loopback setup
> and the DMA reset hangs. To remedy this, extend the guard to include
> PHY_INTERFACE_MODE_SGMII.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

I am not sure but should this have a Fixes: tag?

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

