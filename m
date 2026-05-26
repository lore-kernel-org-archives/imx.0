Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7573CFF67
	for <imx@lists.linux.dev>; Tue, 26 May 2026 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788771; cv=none; b=e5vizd+XqLdIfYshq9UrHHy5Q6aqGvH2S2/ieRJy9BdsdMBWCrVqfP/D/7vnFPL5JyYIVC6apctFzfv8Hs3KCm4K+QLgBPaQh2Sd+gvkADA8Uqtqig8HI7Q6cZqrZjPBhyZKfJs11HhysdK4U86M0YO+7mZvxyc6MZV/hiJn+mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788771; c=relaxed/simple;
	bh=ZCAvrcBAJIXTnHEvSKz8Yq0JKkscj5TsSoJRyS3heaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMtDVNmtVCxmCMofd4UVgZS+Of4xZizRHoqNETOz4BGgaTEoqwN9vZTDMqVUweGD0VxfOJuGKD7JjIhoN0SZf0Qy/HivgwXY5FdjJJ4AIabeAFbhEZI5ov0SDZuLnNBfwKXiJXyECJ+0zR/Zff5eG+yeHOZhB3yO3PrNsvp7WxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fr1+vbDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0dAxKgD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fr1+vbDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0dAxKgD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5s3t02146351
	for <imx@lists.linux.dev>; Tue, 26 May 2026 09:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tNWCjXxY3vDlbxeyc6dAiioLTzJiUtHmEfK77uv8QU=; b=fr1+vbDENVQY5Zkc
	AWKEyhljX0yFvxH6I1SvWUMTfp19xN/S0yh+TGoyD9Cl2mMP1B+cxYr4CMbB+3HK
	i6mgb6GJt0ChQnVW/edYstQ2ZQ/3qEyz7787O7HhTjAw4XPZE3hs5gii8npI7Amv
	SV4YTLdzF9yQsyRYbZhe8MXQpEJ8I1OBPDETlM0oT+VsBZIO/86gjRfEn9vRxRhD
	fa7RK+Fn5PB0Yls+1QT2cAgdVoCp2+ET9/qfV+TNX1+bxgF2y68cg7pgqK+nzx0o
	z9PP/dkyTpf4v2k4Ml/cIFZEvKeM5ltrMipw4x5NALhFjWWhKMw9d8b7GJjlf880
	lK0fmQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv428e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 26 May 2026 09:46:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba3245a43dso115662845ad.0
        for <imx@lists.linux.dev>; Tue, 26 May 2026 02:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779788768; x=1780393568; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+tNWCjXxY3vDlbxeyc6dAiioLTzJiUtHmEfK77uv8QU=;
        b=T0dAxKgDfEDoBnXif3zQrP131tWG4YzmgHiRIyE0zlklmtLcJ9yGyxZMWg5pDyC+1J
         /zwnvcYZvz2UlGz9NiESWjAb27F8/Jw9DGItGMOz/khmMjXvRiCjktW59KCdp2EPJVmJ
         nRtkbhF9CbeMO/lx0tkH+aCWaERSxBKUECyVpwxCKnAjlUhkQpbc5EeTVaC/O3wDAPL+
         8B6CnxnziBr1cKQ6KwWTDP9jnZs2BzpGkxu9XPH+LkovrofSPSLJuwGPYW8GzVTUzZiC
         yyTBNDqZksRdSWlvcVFX56PVTaVnp2q7T3a0O8N30Fpwhr/xD6+M686cvhXD+L845R2P
         Y6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788768; x=1780393568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tNWCjXxY3vDlbxeyc6dAiioLTzJiUtHmEfK77uv8QU=;
        b=P+mNpOAgEUefmmgE4m8jr/vmTH+gWIJU74X+awXjkf4saz4OFZkXxdewtjubpg6zvp
         30AqNaWwaiBBlEScYJ3OMl1emlIoInA9tiHoTseDYHaYxfGclsgm6Mk1yN/XHboDrhxt
         fjYenuwCGqlC6pCRSzWlTDM7Unfzu295y/sv4WU95Sj/o7ApYktIIiMCCNFnjyQPFtHU
         R/4ijQjHzW+3dhFnvg4+7aVUPvVeClTmSGfd2n2fhh+qbul9EWWhCBI5An1AgBFxKXYR
         VKwviOgrc6NNaUCA87ef+znT40X5ndi3UqB5p8Em2jdCVx6pqYlk5EIKXkScIvf4EBYT
         Gb5w==
X-Forwarded-Encrypted: i=1; AFNElJ9663RDhoBE4pOxJPalfXmbcL3hXbeViLA4FUWYet4w4v3/Q1yznDOmK/5LtXb/8BUehKc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrEXynS48MnXXophEtu2CRyPn6z+8MkKb2BAxJajQGrO8yZjoI
	5Ny2AsJS1Ai9muFMNKXxSp9WyLLNOT2EJdsx88PdHysUsOjzvswLyxRpk82KLzOLnJoD88yotCc
	EQoTiHVDE3foyQuVONZi69rh8RKHroMSyQfD9t9zY9yMfYvw+m4C4Un8=
X-Gm-Gg: Acq92OE7G7XVg65Vt7KBLKpY5KcpcFoH0It0LgcPRMNcpmIGahlbYTHCwTe59tbyYRT
	rL4yFDy/r2kz6eEnHLuZ9z7JDV5LQeJBALM+fkugQt/cPxJj2ZqmqwqtfmY8RTEI49L7kUvIAJb
	JLOc/1i9yhXrLrCGLB8hD2VRaCiWYl3b5GtIe1ov7xIeNZvEolWhnbZYc+LSf9QY8DA6feVbg6q
	tm12jkmm8XCJZCdiZsfOgRUV24POQ+TJ5DzfLrkVpWuELVOQFyhUvl0XVHfWZPzTCpZiJNU/XAT
	GkgAJZJ9OSOUQUOwXlpAZwyV6Waoe9FC97mhLKBcPH+CyHP+vC1shoN5F7wWFjY1TZOMgLbJL2q
	ElIUo7INjV9tyJlSPLXWclouRjdWZKTLijrfqbi6fjhfuINAnWO8auDb1
X-Received: by 2002:a17:903:41c2:b0:2ba:e42a:231e with SMTP id d9443c01a7336-2beb064837dmr200645375ad.37.1779788768341;
        Tue, 26 May 2026 02:46:08 -0700 (PDT)
X-Received: by 2002:a17:903:41c2:b0:2ba:e42a:231e with SMTP id d9443c01a7336-2beb064837dmr200645035ad.37.1779788767805;
        Tue, 26 May 2026 02:46:07 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2ebcsm121223885ad.49.2026.05.26.02.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 02:46:07 -0700 (PDT)
Message-ID: <f2eb5c9d-a78b-401c-8796-f7ef7a8d7386@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:15:55 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 0/3] of: parsing of multi #{iommu,msi}-cells in maps
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com>
 <20260526-finicky-crafty-hare-eae27c@quoll>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260526-finicky-crafty-hare-eae27c@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA4NCBTYWx0ZWRfX9JYJqSugz/na
 xa4KG0AlnvnqdfMgFtctaZdbdzZwXodNL7qgfSUixH2jBGnqCStx8K1+OTP6A6LHZCYBYAJ30uv
 riEXsilIU+oJ5DDrVipNlhT7Vc9FyhO7aeBhCKX43GnK0mdJX3+ypxitK4JRF5gmD06jHtprYFK
 OJza1DrP7igNYQXYbydb2wcNkvv/exRlyhOgs265Iemo0AyKKzI48bBXhZdkNQlUTR+fkn1VH4o
 cnWxheHVdbsBnSzihnblf1Jy56I9URYbdbyhH4efPh4J7HZ1rfYo6BxoCDHxcu7BNWXCkV5i4pR
 bJKka8++xDQXyekk+1j6FbLNPyMvux7qvY6FtmHJQqsOu9baSgv11aVk7hnh/2HtIhVhOt6Er2+
 Bu6C4+ihevujoC39ly1MU4Is2M9vwTwBDqGWQEAWjOFK2xnLJBFnK4lcF6hQth9UbU2NKlTFzhs
 w/kicgQkeSe2ienQyLA==
X-Proofpoint-GUID: bJTot3gB4eqfkWxyYcpwdrVI8owYyYPI
X-Proofpoint-ORIG-GUID: bJTot3gB4eqfkWxyYcpwdrVI8owYyYPI
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a156be1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Jo8nEopC4ZUABtMbiE8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260084



On 5/26/2026 11:42 AM, Krzysztof Kozlowski wrote:
> On Wed, May 20, 2026 at 01:32:39PM +0530, Vijayanand Jitta wrote:
>> So far our parsing of {iommu,msi}-map properties has always blindly
>> assumed that the output specifiers will always have exactly 1 cell.
>> This typically does happen to be the case, but is not actually enforced
>> (and the PCI msi-map binding even explicitly states support for 0 or 1
>> cells) - as a result we've now ended up with dodgy DTs out in the field
>> which depend on this behaviour to map a 1-cell specifier for a 2-cell
>> provider, despite that being bogus per the bindings themselves.
>>
>> Since there is some potential use[1] in being able to map at least
>> single input IDs to multi-cell output specifiers (and properly support
>> 0-cell outputs as well), add support for properly parsing and using the
>> target nodes' #cells values, albeit with the unfortunate complication of
>> still having to work around expectations of the old behaviour too.
>> 							-- Robin.
>>
>> Unlike single #{}-cell, it is complex to establish a linear relation
>> between input 'id' and output specifier for multi-cell properties, thus
>> it is always expected that len never going to be > 1.
>>
>> These changes have been tested on QEMU for the arm64 architecture.
> 
> So there is no real user for that. That's unconvincing. I would assume
> that at least you have real user where you test it.
> 
> If you want to speed up acceptance of your patches, then also I would
> prefer to see at least one more user, beside Qualcomm. IOW, show how you
> solve other people problems, not only yours.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Thank you for the feedback.

The upstream user for the multi-cell iommu-map support is the Lemans
platform's VPU device, which requires iommu-map entries targeting a
2-cell IOMMU node. We are currently working on the glymur series [1]
and once that is finalized we will post the Lemans patches as well.

That said, I think this series can go through independently for the
following reasons:

1. Correctness fix: The iommu-map/msi-map bindings have always
   specified that the output cell count is determined by
   #iommu-cells/#msi-cells on the target node. The kernel has been
   silently ignoring this and assuming 1 cell. This patch makes the
   kernel respect the binding specification.

2. Backward compatibility preserved: The of_check_bad_map() workaround
   handles existing deployed DTs that target 2-cell IOMMU nodes with
   1-cell entries. This series has been tested on the glymur platform
   [1], which uses iommu-map with 1-cell specifiers, and the existing
   parsing continues to work correctly.

Thanks,
Vijay

[1] https://lore.kernel.org/all/20260515-glymur-v6-5-f6a99cb43a24@oss.qualcomm.com/
