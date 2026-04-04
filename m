Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181B391E68
	for <imx@lists.linux.dev>; Sat,  4 Apr 2026 10:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775299380; cv=none; b=ahLroCPD9lDhssr5ENwJOjtuP+tggSPa8WCdXOu7Cmw8w2scIJvxR7T/eab0Z/1hUO5DKBtUQTneKytRPbWq5MpwsN+FLZvnxdZafmrGVznRH1tE9DEjHS03UQ/iMCo4kWMSD/DnjVwFPufjE0DzZBwLf7H6C3GA1gUbnVEDuks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775299380; c=relaxed/simple;
	bh=pYfcGKdx0Rryej21BO+C9aP0J1cNhKpphMroUhH0wsg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mCedYG6JhQRRXf86nvYPM9nKvx3QhHzpvZbYu3Q24vYRHKwzjvFTUlhvL2HNxcqDxUt20hv+INuJKqYiDWIciuQ1R2CQjvc7gYohT0NjgGsM9266rduZ66omfRFKnZrzDwuXeB3kc7K2AZHlTzcPFORClQysDmmsq/qLYFGjtz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bS/J3/eg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A0MjZMAn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bS/J3/eg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A0MjZMAn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6340gxoi1345077
	for <imx@lists.linux.dev>; Sat, 4 Apr 2026 10:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e84297XhT8HmGfOAGvVKf9pMmA+a1FqZAkjsY4N6Eoc=; b=bS/J3/egbPRXKEyd
	vluVPleDYVVweuaDNqrB72HsQf37Qocy6KhZhVk/8ZFalQ60sv513OllyiFnaDjG
	ify3GMbq5HAHrZqBIQe90a3atcPOtIWAzFEjRV/+IigD/vvsNcqMQLegK1oujoN2
	8+4xLXEcq/DT2+HD1Z8GTjP9AAIQYabw3PN2Neo2OP7mw2R/4klrZTf9v2VCYKoO
	mv7+A4oPgrSnSDEjaaSx2d8zJ9jw2Jz9NSEwtsDzAa1ndh2R9OPQT3p7cLnUJCqD
	0stfdctpdjZdjrReB4LvCp4ydTf8giNT/AzumXk+tOj50QampxPWd1lPORF3rISW
	I2+cig==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfgvg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 04 Apr 2026 10:42:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2497cc190so23783985ad.0
        for <imx@lists.linux.dev>; Sat, 04 Apr 2026 03:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775299378; x=1775904178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e84297XhT8HmGfOAGvVKf9pMmA+a1FqZAkjsY4N6Eoc=;
        b=A0MjZMAnji2QHQZi3NFopLpomQ/fEOIKpWlIiE6M1Tyj65Y27zI+wHWrIU+TYo6/bz
         9S3bX4Le/J410yKSxm4lrRPV26KAg4srEGIQ0+QPLtPZYzkGVd1gGXHINQ3xmfgBwuWr
         SQFuGDw7RBEePG6p7uBROHjBm2GMUZUNS18u1K9aLo7B1Bw7VMfkfRK9xn4Mhq+3lpIG
         XgsQV4wFRXfuVUnDmjrZLh3Z5iExnWs9WsZDrHokS9sbWcUKI1ZG/tlNGM0SXJf8mPRA
         XVbcf5vDV0vy+GKmIGJJ7OaMqKAXxVYS3OiFWD6VWL559nJv7uHp87CSzgnclCCN0ST5
         hA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775299378; x=1775904178;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e84297XhT8HmGfOAGvVKf9pMmA+a1FqZAkjsY4N6Eoc=;
        b=Sf9XpyYnoeNSiJ6KyN9mBwg4k5am4Mt8x8W/pLo0kIf5VCckW/VLqIzy95erv2IrMn
         zr6LCiDCZlZ8EQYtTI9TdAlr4T5zckaC4fZEGcDibjdMpcnnIHTxXPkloENwA734fknM
         AdYy8PbTIhrXNjxN6pqPgyDkz2jfd7xUvofuekhO0lOEHbM0cc7pVFkCJkcGGQxxHLoi
         2X5bZp5PjjFxKY/FVq6AkQJusErWN05bgwja6pZnI3sHsSvQsT0FJ5xbaz5TyiFnTbC2
         BOhisLLJ0yq4KZFecuNrlIpMCCOgbin0JpadfS22GnlgjTZ9jeyOqlKcg2tMdygYa4Jy
         PsPg==
X-Forwarded-Encrypted: i=1; AJvYcCU1JmvPRLoDKSfYW6FFOcMb0FmkdoclAYwI2H86VqrT+dRfjoxYsgTUslqsJobvTJ1nwpc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzEF3CKe0JufH4QpkIBeNBKWGyIrciUMeYaPPgBy2CVDe+48Df
	KzhbhhT2KjYV+w6tbT/ZUZydcMltic8ioaQTSTCHLA3RIu2sFcW7T377raNewsdJnxrs60u2dZ5
	+Exyi6LXCMYyIKlgoGSV3jEp/M8wYoy6+F+1t/6B/51JPHZF83vcvs0E=
X-Gm-Gg: AeBDiev2nGjzBQ8AHubc9IVXJJ8rp3mKfQytIYIFMj06Aveqh90Pil1goezIDTa8cz0
	5RTHA9CLkku0pUDzhJFaXsrcBbu7oejTWQj55kDl8VxGBlwqGy0TnUAvM2j73RRHxay40Mdsgjj
	CZnK94PnCcrkOwuDDjA+4iB8ABwqY22g95zFFbg7F4ew9ULk2IeEYy7DhGpn9CuAfIlg/YwrWVL
	z6B8Xeuhky1/k7ikcGtsRA4q9zZWOfQEGusC58BoIyeClAfn5B83j74dXz+JN1x69EIS/1iCSXu
	MZviX1i2H/65tt9bWBHSrsiaFTSi0k06qAbcEVU+5HTAxngGlrfi2N29RG6yKDCipJBjGLpXosf
	rSvLtaB336pAOCiM=
X-Received: by 2002:a17:902:f709:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2b277e36491mr84232375ad.14.1775299377485;
        Sat, 04 Apr 2026 03:42:57 -0700 (PDT)
X-Received: by 2002:a17:902:f709:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2b277e36491mr84232055ad.14.1775299376666;
        Sat, 04 Apr 2026 03:42:56 -0700 (PDT)
Received: from work.lan ([2409:4091:a0f4:6806:d6bf:182:1f3d:df20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm88066315ad.53.2026.04.04.03.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 03:42:56 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de,
        lpieralisi@kernel.org, kwilczynski@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260324023036.784466-1-hongxing.zhu@nxp.com>
References: <20260324023036.784466-1-hongxing.zhu@nxp.com>
Subject: Re: (subset) [PATCH v8 0/5] Add i.MX943 PCIe supports
Message-Id: <177529937123.12054.16299397232734906774.b4-ty@b4>
Date: Sat, 04 Apr 2026 16:12:51 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA5NyBTYWx0ZWRfX1IXN75t3zDM4
 NgYvS41vImF2lollsqvAjqIKI1+CpcFZlPh7u/SmJtx6WeXspo3XHkqO8pZLFozx3pPn47j0sW0
 SMN3GF5FhkEZt8veLqNw65NNt54QG7vhqYDE/c9FJF88GQXvUoowtCj8qRRVjX1pCT/+z0HL/gt
 jsN312cDSpaJwTXZY6m47IYF3dlT3ID/duIemALTP7LUC8Q4CxViDwSljcau93rt5P7Pwusjv9Z
 9cFp7fD+8pChOUD0tHRkJMabbGTvk1x6FSm2d6IdkDY8C2eIDU45pjQcMTgUSLWiAyqC9MHerlP
 tBvwo2Wn3+ScUclALcmbXzZaaMuJnRlTWZFh8fMM93zFH+E8pNxTzwem0epb8XKecxmy2AYVQEw
 jirs2KfB9AwHirxxVQbNOMMs3rlVBYR75u83hHI+YuG3uzqVd3trFLPb2PO+SWKGOyB1N6x5KPF
 SMIrajrHpUzCsYsUtyw==
X-Proofpoint-ORIG-GUID: SHvKIyLSRkCutiBQQoUNAD8uhXuyf2XC
X-Proofpoint-GUID: SHvKIyLSRkCutiBQQoUNAD8uhXuyf2XC
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d0eb32 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=8QGBsu52YCFcfEt-ioQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040097


On Tue, 24 Mar 2026 10:30:31 +0800, Richard Zhu wrote:
> This patch-set adds i.MX943 PCIe supports on EVK board. Please pay
> attention to that it relies on the patch-set[1], and the PCIe1 port on
> the EVK board relies on the [2].
> 
> Both of them are included in the v7.0 kernel.
> [1] https://lore.kernel.org/imx/176649331066.523506.9443864112044699350.b4-ty@kernel.org/
> [2] https://lore.kernel.org/imx/inzg46tc2fwsajxq4vzdyuiq7krzy6xtcg2mjaieninz7zsmgm@mtdjr4tuegpq/
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: PCI: imx6q-pcie: Change maxItems of clocks and clock-names to 6
      commit: 401359ef44af43b6b775dc01bb7b31396db67aab
[2/5] dt-bindings: PCI: imx6q-pcie: Add i.MX94 and i.MX943 PCIe compatible strings
      commit: 4d7937d8cc32b027a14cb8152d9df64d17e9392c

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

