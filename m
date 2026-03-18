Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BAD2EBDD0
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848399; cv=none; b=G3+AKxj1FXiqghNa9gLZAKJvcVn36r6KghVLhZDyoRXQXPMbMnAWlKEm+SeE/3mPBpSVfxpOZNGOu03Hg334OIJGEYGdNVRpxQbbu8l3hNZta5P5cWy9LsbfnjtPkMWsWM2fE0O4iLAF/TerF7YqksHDkJ76HJjjBVmU9Dd6oWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848399; c=relaxed/simple;
	bh=nzR73bmLIbN8JP6GHPLqUyrWPBe2926e5uSEPpXi/5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=glAYIOxWxUeSFXfyhoIUMVL2TGFH0DY5BPUV2USHSs8vinyrjEGv7kvOecv26rbOTumWEPezHX9f7tZvJaUhCA8BtXZpq5E1fBk3cxjVu4Kmqu3UwYIR834WABOaMACIIb+51z4w/oko1L9c8NJlW1gfqgRjzzjG+ct/a11SVqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKzZSSBU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aXSlGlWN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKzZSSBU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aXSlGlWN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFWwn2894391
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aGa+CLZzKHoL/VZx2fIYOeAn8vQRWoCpwsf+TJs8OgM=; b=WKzZSSBUrBON1rx+
	hM7vlcAT4WcBvaPwpP3WAzsNFI/Rb+sKPvtk0Tb8yiOaSdeiBAWilE4ZVaw+NG3f
	l6ZkRjKBvf3I02fCT+QYnPDwJjiBamlm2pXOTtgEP/pVT8ueO7Wq+UP2qNjOIKyy
	7m20AaqNZvBefUG9NALIZ4th9ddEMgrEdALwbNVezgvPwF+vhu1VoHDabIZ6V8mG
	aInT6XbUMNuXrJSjJXQDFrZvovv1I8kKfAtsvp6av50T3u+sJW01D5SvwmVD3+jH
	4tw3JNL7AJnqY9qtOzD33l4DYZb+jE/oqgqx3mEBXrJvT1xV4lW37fuMs1X2SLK9
	SZvc6A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyrww6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:39:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5092efe29dcso67274921cf.3
        for <imx@lists.linux.dev>; Wed, 18 Mar 2026 08:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848392; x=1774453192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGa+CLZzKHoL/VZx2fIYOeAn8vQRWoCpwsf+TJs8OgM=;
        b=aXSlGlWNj+GlSlUK+ZY1J+J2K86OE1I5ETSyd9s2HMUF+CwCjCc7kT6uk04f865PZ2
         wBjjl2CTEMgp4bvCgI3v+ypsuzH1sVhytrfYgDAiM+7dSvJPDmZHi9mM3GNNX0nz/5Te
         mrSo9aU82F/ip8xOzfh6wX/zuv1E9ZG0ab4pM62zWwIhSj1Zwp+LfDWUetFDtwkk62g+
         zRz8ORwhsw+HjNeirOoe31VXh6IVeOVZRzqDm79HeRbE6iZMOUSw1EK8CLMreyg4gNZg
         PV90E0fA9zroR9TbTDCD0hFqelVhdf4eHxbfdIv9YmwdSLbJafIYs5EGmDlxzmmwfdjq
         e6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848392; x=1774453192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aGa+CLZzKHoL/VZx2fIYOeAn8vQRWoCpwsf+TJs8OgM=;
        b=Kmr1mkQOeiAcIkZuD5+IJ/cyFkcBBlqnQs93ApiBdtTfHQ2GMFKRLIix9ciU+OR43v
         ZYjsweSFcDYndfucbu0OQdoSgdDO6p2uEBQog+DrRcoLCxC89iMLNW84SevUPIu/M5Xa
         RvhmzErtMf+rRXGtsLBuaDDB4NDpvSf3uCEEtF7QvSP7WDGE53YCRSRUUSCk/PfaY3oF
         RloPjUdYgYlwfkRy4yKICSSjPOXgk3BjegM1wZiqXxtEr4PA6tG3McQ8V7LcRFj0iu5d
         AtemlnT/EtiNywl6ENNlg1xP0jVvdbrMgpa2vDYQw59nYJZJ/PpWlnRovtqsVogXmsr+
         ArdQ==
X-Gm-Message-State: AOJu0Yy4pNjT6QtXbA017YxRtg5IzPdmvp8Y3KcVnZQjkITNWckkyblZ
	eflEAwswHozDOH8imxj/h1V5P2j1/3yME9wTA4uvkKPA39pSN95zq27bbuPwKZ1P9HLj6XzFEEI
	uH1w8hrBWQNBCvYKTSKLpI4oMQUzPnnDHqyRwI/X/jlJrDZa448h8bv0=
X-Gm-Gg: ATEYQzyWpZTUsWIGy1acx2m2kc3/CEi4gxAY4mkyf6r7rbZHLiab+SqbuEIpBBFAtuU
	Y3hmrX/FRI/fTFs4GZX5FVXpxowV/ioh9zsplgWZtIoWZalE0J81171lhxtxuSh2vbHRqOdgoRB
	3fSBa26LNOyuFQewFuBeanLVZBiDRQTApeBvc5wCDyydku2WSHV8Uyyiu1euB2uVRSzLdXooO3S
	3tnh0uFCZUaPLf28KEAl+ekOj6NprupyCocaRxu2aWwJuR0L6XXudXYF6jHCXwdgUMNRciPAkVp
	Wgl2MzeSGYpv8VEABdcj1CJA2Lik2u0Ab+cDsxS9KaaBTqEkUwqC6zVnBX1SJPIUuTqrN63vaen
	4REicauRS0T0m17DmemVrJAwru44=
X-Received: by 2002:ac8:7f43:0:b0:509:764:2efa with SMTP id d75a77b69052e-50b14970746mr44003841cf.59.1773848392411;
        Wed, 18 Mar 2026 08:39:52 -0700 (PDT)
X-Received: by 2002:ac8:7f43:0:b0:509:764:2efa with SMTP id d75a77b69052e-50b14970746mr44003301cf.59.1773848391774;
        Wed, 18 Mar 2026 08:39:51 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@ew.tq-group.com, linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/6] TQMa91/TQMa93: display support on MBa91xxCA
Date: Wed, 18 Mar 2026 17:39:30 +0200
Message-ID: <177384710699.3709943.15119808744846226228.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: n0Z7Gl8vVepm8xis-lUhocw7zxM3KRpp
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bac749 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CwIvE3oJpDz1FoVedloA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX6ubEpRZ6FYeq
 R5tDXDYfHsgia9o3tqhbSL8YtPMb0tA1d16HG7n4iNUTtZucUGS5TP9oi3hX/tqJFF+UcO4JiDp
 +CwOYftTexQdOTy/8ijPxLF472z42oMCrtYEMIaFYss9erZYGBsNyEHUb+AizZSAB0hsjlmcMyB
 B6bvyZbVBJmQX6sMyWolslGkOljlbwBKQHSa8eVAArfxeyv6BaLve2ThSRqefszLgX9SaqV/niT
 it1tMhkpFdTz+ZrFuWsNM5oVNqJvWc62YATRWJ4EK40iqqQnv7MbhTSlbH0W0gL6Ly9W660ZAwr
 wPvS3j8MlPxrrTnc3ChSvoofqwqlAXjfecuv9HrWcMEVtra49SUCI1mX4AWNQTLoIE57w4Etsbq
 7yUTePSXom5Eg6meO/3742tHij90n2QeS+IZgWk3kHi3H9hTVCGdqFt3v91WdtQl5QVUcdNdF6C
 SvnFqxvodc5KbEydPtA==
X-Proofpoint-ORIG-GUID: n0Z7Gl8vVepm8xis-lUhocw7zxM3KRpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180132


On Fri, 13 Mar 2026 08:07:30 +0100, Alexander Stein wrote:
> this series adds support for parallel and LVDS displays on MBa91xxCA, both for
> TQMa91 and TQMa93. The parallel display is attached directly, while the LVDS
> uses an LVDS-Encoder. To actually work it needs the pdfc driver from [1].
> 
> The first two patches add required (Video) PLL configurations to achieve the
> necessary pixel clocks for both displays.
> The last 4 patches add the overlays for TQMa91 and TQMa93, although the
> overlays for TQMa91 use the same overlay for TQMa93.
> 
> [...]

Applied, thanks!

[1/6] clk: imx: fracn-gppll: Add 333.333333 MHz support
      commit: 3cbcf93329c0d40c722122f550bae8f79ca3e65e
[2/6] clk: imx: fracn-gppll: Add 477.4MHz support
      commit: 0463762fa001cee153ac0edb538fd5772a93768c

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
