Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90375429024
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 11:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239076; cv=none; b=kEyYxeYHz5Uf5HoGB3CU0rVCtfYJiZlEo/LVRLod875x8CHAYpcbpW6T1wTXjWP16zuIh/kmlMGMp2TTZW1Vat6BmmIs6db+syH1xUes3mwA7DXi99xErg4JodQBbUfXlKrgVAN5ezRTtYR1EFJfmfUGT9UpymUmBFsfzjXXFeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239076; c=relaxed/simple;
	bh=NUmY9HoDyy+tCMoMSRiHT6CAVHq41HWn8qpLFdXnFIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kVT263HWYtioIjKWQCCgXiDSBJqHiPJJkXEQJ+S3WWf106NY8CG66NqI3JqjkrIxepYxLJDU/uoQ7nP9gtX3FS1agh3TQDed2aYUp328YxprKH3yojyaoXhAJ1LBV6fscqAGcyRGWiAwomu5LVb1tDVkDQbl/XfB6O2nionAa/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dlWMw7e6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIb7GIvq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dlWMw7e6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIb7GIvq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBH2kh2776869
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 11:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qa17nlAEivQSWbzaXs80kMBBgDJF4lnbbP1Lr7oQ5Oo=; b=dlWMw7e6Hx+zrIVY
	mwfo8+7Z40SpalpbdMg5hMDhB6cemlZSw09jDWcABAp8hXc5CNhP1hvy0fbfM+pM
	l9UliaEl/gRqljos8B1lP0wtCg/OmxfDgv5kA5Dn7oDpcIgtrwKfHO3ox+XvXoIF
	z2EMctVZA3TPllqIWu8joxRoRijqNrjoZND3WZR6RtfhO1GyzamiZgRvWXuaRtWs
	J9sdqE7fPmm3Pa9e3wwYz+4FiIIY6i9I4/0EEbOMEL9xg9xm2zJgvOsddEFL9mxA
	V1o4ZGlMiVe18xdQ1yWe+/+xCkEgyXGXD0KpVVZ3Jz3ldZWxLaT6fbPQzHf+CAkL
	2qx/sg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fptatgc4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 11:44:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so46284611cf.2
        for <imx@lists.linux.dev>; Tue, 28 Jul 2026 04:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785239074; x=1785843874; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qa17nlAEivQSWbzaXs80kMBBgDJF4lnbbP1Lr7oQ5Oo=;
        b=IIb7GIvqjAn6Y6IZKnl5ClJwLbSfTP7Iae+yOSSyPZgYc6StgbI9uwJXuSpWg1PYOJ
         +fVY5QqRdJxYZ354EAr6KOzEJY4Q6VU8t6GmKUk4lHnAhFeqXgBZpZsNyu75EZe4yTrF
         EITzisM3dHOSugydokbqhEKC06zawl0bjSZupyyFJtmUgI/Ju/uKbntNADHhMWmJSD9Z
         VW+9V0MGUpjwhiP0uh13UDBpnOD1tezp1UMdN0rM6jurohWfw/0s9QY9My0mIFGOvVKP
         JAWvlRhl8XLkKIjda9g2e8EezaKDkBol/y6F7HMEyU984ck1NW3Wu9RqWCA6bb4UAOsl
         1UvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239074; x=1785843874;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qa17nlAEivQSWbzaXs80kMBBgDJF4lnbbP1Lr7oQ5Oo=;
        b=JcudktcQo6MJANiAsOdgmWIRcqJxB8X8/J2fM/zHr+RWf4c9KKVbpvXtBGgPH7NKqO
         CC7NSZQZ2Hzyqquo9myuL54Soy5y4OlyiJtrvYZxQKQNi6frU041+uk9CaJqM/Gf6Q7t
         f3PXBOy2+UlEaeqZRjYtCnsk6P03MUBfFoCqxpE69i3xP1xgl8dCzCxDlF7aVsxZBa6z
         Zi38JW64KTiHREuG94DesV5W2aRj87+VS9mhv94IQjjNI7WccfIpyB1jIawoI6eru+QU
         WsYmnW3Q0dEJRqMcYH2uGLY6xmW7fckGitW8RRuoiiMHLRHe1p29k6qJRwl6aESu38+B
         3ZDg==
X-Forwarded-Encrypted: i=1; AHgh+RpCjAp0M0HzwJugarW2qDB62khJNnZEMRhKut9HBJcFg/1c4Pi8O2wGYm69jg2s0OSh1uw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVM/YUR1/Fq3Cd5kkpY9XIzB97HY+mxIjr258sHdquY/37LyLf
	axpB8fWEBQXhEF1zB+3KFZ62Ru0iXq77DwVdUOHc+Q6rWp7IEjsNhr6/WC8XLL2/QJVCoIEkxXk
	KQ9kOK7En1XPv3mgNixn+qnrFwQCbOEGkUl8cy45Mxla/s8aUcBzDcEg=
X-Gm-Gg: AR+sD12dC16XIu1BshS0HbrI36KueuT2XPDdEXZgrzd8oAX1bb5fdFDvaFzyzI7Duy4
	EWJ4Qy4Vg4xLG6wkfQX42UXr/2MZxhSpl0sCIvWv9SWHmZnApmXEao1yJO2lyjN316rrQAbBZbS
	+OBl+54dgM3JLwBqSkEnGgVXokKJpQiMBa7WBeHK7HMhv1SLioA7zw9LUbP3LEEmsACRs5gR4Nd
	nStd4byXhSFYEooLJrz+oiMdygc+VcxP/wMyaDq1Vqyy9GJQn/neAjkV48fx9crIBTNrf37NrTc
	FZiihtB1AZQ/0iQGFQ/doZo3mapewYI+7nx4J+EU3XlXe6Pe+XDqG51nT2qMcMRifC5ftBlvgCx
	GmbV1ZURI8yLaFk6LLfTI4PtaTcY=
X-Received: by 2002:ac8:6f07:0:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-529d709e483mr16956621cf.5.1785239073425;
        Tue, 28 Jul 2026 04:44:33 -0700 (PDT)
X-Received: by 2002:ac8:6f07:0:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-529d709e483mr16956121cf.5.1785239072790;
        Tue, 28 Jul 2026 04:44:32 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46160dfsm68407265e9.10.2026.07.28.04.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:44:31 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp: add missing MODULE_DEVICE_TABLE()
Date: Tue, 28 Jul 2026 14:44:09 +0300
Message-ID: <178523892597.3206426.17434896362828109375.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260705001705.70400-1-pengpeng@iscas.ac.cn>
References: <20260705001705.70400-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfX1mECresHWfAU
 DDbUtDy4m5zAiPvjRqPaxqbeOS6WYjn5wt2qT9eGZmVdMwjk1zAXRfy6NukXp0SsUq61EML5RST
 rLSEy6F+WNnotU4G+DRgF15OIa9mE4s=
X-Proofpoint-ORIG-GUID: Qr_GC2KWMc29FA9PD6pjqzeMHlrtg4xn
X-Authority-Analysis: v=2.4 cv=KtJ9H2WN c=1 sm=1 tr=0 ts=6a689622 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_ysCb4Hr1M9gRo8ogBUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Qr_GC2KWMc29FA9PD6pjqzeMHlrtg4xn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfX+/+EcQAS2DUY
 iPX6O7LVQq/htpfVSLvYVPS+ccmDFEiGpN9LbOCeuVfsdXJQ3ukU2kZ1h8qIDjUgvBFzZ/SPBCw
 wGu5QKd8yv2aR/PGD1p2/DLqHoeOF3+mWZgZCb68zyIPrsibkCpGwJ2TPMHqm/OYl9nB1PkSEr4
 vD3HHYfQNjFU/OBeOERRigXo4XFnrWv5/wIc+rXDVfMHoWbIhyiK6qpVpfYlFvMD0ffQk+KIBOx
 Ttn0Fo5SjNvDed6KB0wHaA+mlRxVWMhJRAk7BLglykI6YylL6VwWD2rN7THz41vC4TnjMDUfDdt
 fmFlNuSDZ04f1cAYJnhlsD4zw6qCvwJqCpsaGzWpofM6IREhal0bjca08n0f51VCuQi0O7RxCON
 qUHts3Ora+puIx3ZMusckFL3/xb0XRg59h8Edfzd+99V+xcFht4dYI1QrgFkpnvtodUXO0Pbin/
 567WHUmBrYTYyiPorAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280103


On Sun, 05 Jul 2026 08:17:05 +0800, Pengpeng Hou wrote:
> The driver has a match table for the of bus wired into its driver
> structure, but the table is not exported with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE() entry so module alias information
> is generated for automatic module loading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the driver registration structure, and the missing module alias
> publication.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8qxp: add missing MODULE_DEVICE_TABLE()
      commit: cd21fdcbef3fb32136f72075ab668b075423b3f6

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
