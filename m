Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411413DBA0
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742854; cv=none; b=guvl27Fw8tZLyhtm72Fejw8IxT/9wDHnmi2TXvBgXRZmVokLsyArHaPm14pKap44qWoOQYm9F+rTs7JrSoS6FHF9BLEnPPv9wHYQpbE96gUJ4Qzo+Ohx+lPX7SCh6UojxnFVBf00A8MlhKoBg/YoOIvrsRhcUTwgXMQJwnsqewU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742854; c=relaxed/simple;
	bh=yErJLL98hdTML6PW3FH4umtbW4GXGMxBn8V/sVJPrCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVcpvtqU0wyA+OWmHiIjHT+EexhvbqOSRtpNLt+2gW+GgOlx4W/whHE9H5GbamuJF3fkwOa/Mjd4X9aAAQ+IIqj+gn9XVE+a5JvKH7IHbnnVunownvDmGCVXe4cGZhzpIndljIogRvBWQ8w4PJ0+G+4uyd7xiZbObYQzZkhJTCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LeCjkdQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WL7n+865; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LeCjkdQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WL7n+865"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DdLsH2812087
	for <imx@lists.linux.dev>; Thu, 9 Apr 2026 13:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ARYmkRPpKFMxzpNWiTfhAHXw
	TL85m+s74YxRm411o+E=; b=LeCjkdQFSY1SNeRMTUnMZDE0TIRyJTE+U4B4jhNy
	BMSDfqKyxelqxXjDWYGL344yhGx96le0BqUVUVyex6OCqvs2nCaVJ/X7oaSSvJCS
	r97lGvIZ0OaiO62hOkCJDPFG/0NYFjE4RHzpO2/RF0wRpiWw1i1XKqVYfraFTb0x
	VsAFJfbBQxJdG4hzz2ayrqD0si5wU8bNYX7gQRs1jOsyeUTFWY9cM4EbEmn7BuDW
	P9iumCIN5BFebWyYr7Y2bgbNBDcyD5cNd9TSfDzRd6xpNckomtIEcxOVpVAezsX/
	jB8cixACnUNtMuIbzSxOfnt4z4edigxusBGcieiarTYHpQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6h81q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 09 Apr 2026 13:54:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d63962d83so25682501cf.2
        for <imx@lists.linux.dev>; Thu, 09 Apr 2026 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775742850; x=1776347650; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ARYmkRPpKFMxzpNWiTfhAHXwTL85m+s74YxRm411o+E=;
        b=WL7n+865tZ7DqC7jqi1liY3RY20da7doIHnHuTcyb6LG2XyilIJH+bv/jVxWvtqE5k
         JVi5BGtwqy4VedH5R+hpoM56Qv9riqff121q8DHvBjTyrItGbKAuSqWz0vCsWE47qoyd
         V677O/+ybm0AsHmfxuKvgm5Pdv+RV7BFWuGY5VuIFNdGma1UXOHb4qPnvGqCkujzf+is
         CSnZpXrvyput9QgoFw5C5Ml+9qSNZczi1GwybGMSBbIl4doOUpJez0fL1uBFHWPVy7I1
         iV8kcd8pV44K3u3phatJd30Y+G/RhxuUhBYUSZfQtlrK7mmVrF+9/5Q4Ys6nsz4e00nT
         kiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742850; x=1776347650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARYmkRPpKFMxzpNWiTfhAHXwTL85m+s74YxRm411o+E=;
        b=ZlRBcQOhkLjahyjPEZrAz2tsT9cczeNMtI/0JUJLrn2alXsF2xID3WitqAuRcInl1m
         FKvBySmOo0KBQQKrk0cY6dKeIvPi0Pd82byWB1Ch4gVngv4nnWT1WwHyKigN3iz3oatc
         +0qHFdHrk6X8iN/6x40l8Cf1qRHOb3wp9EYcXOS6IMFLwEqDzMNXqLLkSuAxlPd8yY7n
         +ch9n/Ky/P/A9tFkM3+QxUBXa1oYd/auTGyBa7HEEcYIxyAOMhi/ooclrTF0t/4E8mAZ
         RUrCDmT5u477mnas4Is5A4TBdC0rWp3Oiqn3MA7eyLafamC6gpYd/KFXhAzsIJw8+Hdh
         eF7A==
X-Forwarded-Encrypted: i=1; AJvYcCUOKNc9yJ2Rh129IxiNtW6j8xXylm65hdGDlHzxygWUrVsL/XwpITofJKLqbsiqIS83Vuo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxzk3Z3/Y4QtbdFiqJ49yyR/NQibB0JCoMvEYrimGAX/rq3lo4r
	+4sZqKJFvl4swcB+tD6KhEqBuGMvdxq+j/baWyeAih0ag8OAkRIA1K3uRPEdYysGjSDumsRsgvt
	6X0FvvSBiYFXUBMaw5VTHhzBoUNCLKYrOrwl50Uq0e+iw9AKUycdj3tM=
X-Gm-Gg: AeBDieuiEPuPOJ5vv5gtNN5V2a+VP6/Nenu67IZTl7jfcqyACwfjy37sw8Eis0M2vQ0
	0/CN+EWodqzPO/lkC4ewdp6ATWS0vVq00luHX6KAc+sj33/9Piy/axd2Mx8yfx7msO8sfE5xwrW
	vuYHdPyHXlRjNi1e5m9w5HBqdJe+YQPZJKEw4Ko+UaTnJfJ9f+Ike9xCe8piA9R5Hik/ue9xrch
	MQ31NfMLje0Xbl+rFjtt7DiKu9dHJ4bd3pYodQZvjZ+nD1lZklodbfMqyabpvn7weZDze3VCjYb
	Z6run8e8IwubS6u9z1nBkO0d1ni6mP1oPyzdzPV/9LcUevDiuPcXwx8BwgFzFgzBiO0RcAnVx9G
	FWUOQo8huEw7p49vv+kVNFCinOy8RexM=
X-Received: by 2002:ac8:5d8f:0:b0:50d:8049:2f22 with SMTP id d75a77b69052e-50d80493031mr282328921cf.3.1775742850493;
        Thu, 09 Apr 2026 06:54:10 -0700 (PDT)
X-Received: by 2002:ac8:5d8f:0:b0:50d:8049:2f22 with SMTP id d75a77b69052e-50d80493031mr282328401cf.3.1775742849909;
        Thu, 09 Apr 2026 06:54:09 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f73sm71965374f8f.8.2026.04.09.06.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:54:08 -0700 (PDT)
Date: Thu, 9 Apr 2026 16:54:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Paul Geurts <paul.geurts@prodrive-technologies.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        martijn.de.gouw@prodrive-technologies.com
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Message-ID: <l5fcjw4okcpk3nl243xqn7y57nr2mjjspjdfl6m3pi6smx4phb@2qp722n22lyq>
References: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d7af83 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ub0iOiB/G/eXZwGovfl9ow==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=926zIK9uAAAA:8 a=G5Tf7o8FmGmUZZTT9RsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=LlT7wNnaD8DP1V76ktP_:22
X-Proofpoint-GUID: tw4O3Ei4EXMSYowdoo6k00IV9XJ_v5Ht
X-Proofpoint-ORIG-GUID: tw4O3Ei4EXMSYowdoo6k00IV9XJ_v5Ht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEyNiBTYWx0ZWRfXzFbiu7AycI9d
 LuR7DRNxHduuYlNnTPt4DbsyQtIIinvPXmYBLdM1ak71coyGUph8i8nyj5CxiMO5JI/crckhquo
 Z3cuWqi8VJRFK4dL0O8QbFPEvpSgEDtOd8poD/zvGo0l5ySpe2VsjUryHWRh8+sMIQR2o3C46Eu
 re8Q+b8VA6QybA/tZrmaiAzacUSYALBfkDjcMUXEDxT+j2jksDd6ZgyL2cdsQSmCuqD3hruq+mx
 na+NrxcQiNKigZDGitJHZaMFFaBluOkTiy77C3rhWfZPi6M+Hr5wvZZMwt0ZFae8nMaHKZCtR+s
 7srKHOAt/z2PCBmuCxX0cXKUFzUDyq/NshZ/6dAqmI2dD/1ghD9fN6Zzr1kXJiW/t5h7JoZieY0
 bc9ECoSNhkSdz6EgDQVjl6S6d+WxxP8A3a12ILqxRFZu2+rOgxyOBPaL4U1+u4Qysn4KgPtlQX3
 yZUGUcQA+OnRRTgQDqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090126

On 26-04-08 12:13:13, Paul Geurts wrote:
> The i.MX8MM clock driver is implemented as module_platform_driver();,
> which makes it initialize in device_initcall(). This means that all
> drivers referencing the clock driver nodes in the device tree are
> deferred by fw_devlink, which are most of the i.MX8M platform drivers.
> 
> Explicitly initialize the clock driver in arch_initcall(), to make sure
> the clock driver is ready when the rest of the drivers are probed.
> 
> Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")
> Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>

Nack.

Nothing wrong with probe deferring. It is there to ensure the order
the drivers probe in is correct.

Plus, moving it to arch_initcall won't solve anything.

fw_devlink will not stop the driver from probing if there is no provider
that this driver is waiting for. And if there is a provider that is
needed by this clock controller, moving it to arch_initcall won't
magically skip waiting for the provider anyway.
