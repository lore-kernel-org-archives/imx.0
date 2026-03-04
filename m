Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754163988F4
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772616884; cv=none; b=LvFHOkCzU89CvflncjQ6cWkEO4o2hL5QwkommutEJHDk3LbEcg9ymlZHbmKUTSzr+2uiTtOvqBhHL2lbl9PBhrspBztiqtyu3xHbU7hECDbvxJSClYJqk8s7atUXfeY0dUe8JHBHBkOKA8pw3+8LG/EgtIsaERoXjxz2XYnS30g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772616884; c=relaxed/simple;
	bh=XWtG4w+RB2jIlE8XCXYlCTclLv1DMkaQyVrjOrWsDSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mfcnIfQpu63KYq8W8VTAH0JVp0mCAOCe02/5irmUVFJehdsQJCwhZNEHcRm0IuWlOhr7ydZvAwG0IXkgoqTJnGaC5eVlnCb6IjjCfMNJcm1mlZJPF9c7QfODVmM9qQ1LXCjnVwYfKjTM/tJP2Kmu28tG8pwiSDKaDBg44spqwnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKEnwxk0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K05wXut1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKEnwxk0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K05wXut1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6249Kun31456217
	for <imx@lists.linux.dev>; Wed, 4 Mar 2026 09:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eL/MxpDDt/5/2ALudUSxO1nN1iy4vdaNTzKBdYqEsSk=; b=eKEnwxk08ZSuuIb5
	kLnhOzDXKxPW3zLqbJ5i4X54fIBV8ekw6WA+QDZnIeum2m6HgZKdTzX4cPzMLchr
	5neNVC9YrL0B3EGsnHNgfXT05VeYt225ETdM/AVXVP7//SkXB+1NzN8TeDk5RuFC
	27wO/Anxs1VGEBZa4acXnCLLVSO0dORMonWjSO3FqxuXk8a43Wx2H73d1BKdA4cE
	cxQQpibSkWaWAkJiWBDKtr7fW54WyW1SeY84/O6qB+m+jZ3tI0VcQa8JbqlDPGP8
	LB1IrM9dcfY+1udtjPx+AYfb3o7TgoA/Gyl6T/sV5VyaqTfN5LbziEYbwNJlrEhZ
	gV/dBg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj1801tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 04 Mar 2026 09:34:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354490889b6so23311368a91.3
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 01:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616882; x=1773221682; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eL/MxpDDt/5/2ALudUSxO1nN1iy4vdaNTzKBdYqEsSk=;
        b=K05wXut19DWHpWVRYdkyUKtbXdUa9eQxI+AWZo8nF55NKZPjhYx1qOELpvAkIya1vJ
         NvC4tRQ78D0AsFi54vx8TkMsniihcAX4LaPEqRwMoj6iwP8XN2/qySEgfr7AS+TDNOrQ
         vd7lh6RGY6YuDtb5XL0y0LelBozECC0ZnAz2PcLfEDyR1DOeSBwsSCLxL09+uzIAYPms
         QwprnSEQH1Ks0osOkumedHdi8O9wPck1BVTbtSLq2XQqASVSAdKvyuDq+4NddQ3aaE73
         1M1fmgxqhtiDr/CMElKjq2SE7EEKfJm+vGPw/JLK7SDZqqPY5jkxLVpCLiNUPqdxZM/q
         lGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616882; x=1773221682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eL/MxpDDt/5/2ALudUSxO1nN1iy4vdaNTzKBdYqEsSk=;
        b=Ji7ORBshOabyQfaVSETBBsFYKMJgXkknwN/9iYg6Ly0nbIHnh7CgL75HBnvqFB9pHn
         OD8wUMrL1fPvuuHLCC7AFODiKEJ7EeJYDkr7ya2tr2NLNKS+pe6rNK+zAEWV0hyQGnJK
         kQE+kiR1X8Aq+z1qePLZhXWyZNkBRHIlnzEesc9eXRIH21Y+t5XAPAbZ7U3UuFT9swc6
         Vl/Ly8lUbGdjdxqJms4MZcC8n7Jn6FkSbJ3pqlD20ARvGk2zoxsfmuKWkqBcyD0Cj0qH
         hycsr9HyhA1fwX3IMu5mq02dzsCAblWpcmb7Xnu5f43LDNTR6ToXT+PORa7zUo4ydc4t
         5jMA==
X-Forwarded-Encrypted: i=1; AJvYcCXMs/yvUxaGzHzN5nmh47gkasd2OYI6LcptVkNAyO/B6ZYmFu5Zlf3lexZc/GqIfU/NQ+E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcOgNNkRbN1p9uO0aVDfKzUqLu57YrxblxMIxX9U1OmKrEdcrv
	f2Iymf4Yvop27i9ERU9A9asopaZYkzu5G5GzGtM1laXAaDCs+JPQytp/mn37vncIp7UW0CWQ4Pk
	RZADFh9szA16oTS0ZJ+ZV/cVurW6G9aOw6Tgy7/MYdSvnKbZ4V3IGC8o=
X-Gm-Gg: ATEYQzzKysdFnkFtlPNBAwyojQOig3tCrhVjgIRhlTOIapnH9NKEVKgr5b5bOs3QaZz
	lD8VIXWGTrldj8GO6KFTG/b9aOuz2IBqkCUZvr93jBW1vDSz1+59cov2h4WNs619H6PYMIVV+w5
	nAjxEoQIEwUsMLQjSwYh0chnqiQnhrrnGp+lZEslLOeVITAamr63XB5ISeU+rIleAkNCYD80qnM
	7Wa+//r6XcwgqqpZ2hqvrAykuvtI51hDvp0VH2FmK2GZ3xHnVSB6kAKWZCEmAFCzsygP7EaJT/U
	MxA9L6ljB0EIHphFRDAO9xSbeU4orJm6WB3c3zDsPZZE0B3RGJVVUowa7BQaP3JBboJhk44nsBc
	Om9jZSIXW356tAr9tGoxi0DXB2YmDmRS1FEP64UY5wAL2dImETDDZ9IGh
X-Received: by 2002:a17:90b:5784:b0:359:8cad:bcdc with SMTP id 98e67ed59e1d1-359a69d6372mr1471616a91.10.1772616881615;
        Wed, 04 Mar 2026 01:34:41 -0800 (PST)
X-Received: by 2002:a17:90b:5784:b0:359:8cad:bcdc with SMTP id 98e67ed59e1d1-359a69d6372mr1471607a91.10.1772616881094;
        Wed, 04 Mar 2026 01:34:41 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359a8d65b31sm500720a91.0.2026.03.04.01.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:34:40 -0800 (PST)
Message-ID: <ebeb6f4b-4195-4e9f-b211-a8e11a875b7a@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 15:04:30 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a
 struct
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
 <bo5kb53hrzvl6e5mctvnpqluobdgbpq4x3m5ca7mwtfnl53npw@7axqsph2vyqd>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <bo5kb53hrzvl6e5mctvnpqluobdgbpq4x3m5ca7mwtfnl53npw@7axqsph2vyqd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PNhhtSDvxl922SQmpWEj511Hzard4n-l
X-Proofpoint-ORIG-GUID: PNhhtSDvxl922SQmpWEj511Hzard4n-l
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a7fcb2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=kVzFkbBwBCoyR44kgfkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MiBTYWx0ZWRfX9FkDMoevEum0
 arXrNjrPmX5hrRgKaQrE9+94E1YV+73oq9Ocx1sOu1g9p0k66J7nU1jtLIV5Xe6jMx64dRnEIS7
 1yIK5WvLteXGJ/5pCg954y01g1WdH326FzV8mDWjRltTcewYzFzC1BgFRxj67DYApOvVIPBxCyM
 Id4lZb9wZr6crYT9MM6coJmrGTkNowP1lgC9YmSegLQ0uvPaIVVpi4stXQ1fZAKXmt9GvCT6sgy
 /OcNaestnmjb3xjNzWMIcwQBs8+3skR+AlEvl+n/CQIpuVAK0Wiwfl70Y0j67sd7JI69/VBfBex
 VsImJfZ1NAZ2uJwFYBDZL7YTQilbmQmkOFbcJkwQ3nQx6bgo67ehcaIYJs/KDQd63vtkcjUZ/Pe
 3gdvqRxjilsQ3tiSdTx+WxNG0NCZmuqfWfY3/vFHffPhc7qSOQvrNl/f0TmEIEeK4JNugUPR5v3
 y1DwU/9coYpwRNhyJjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040072



On 3/1/2026 4:29 PM, Dmitry Baryshkov wrote:
> On Sun, Mar 01, 2026 at 02:04:20PM +0530, Vijayanand Jitta wrote:
>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>
>> Change of_map_id() to take a pointer to struct of_phandle_args
>> instead of passing target device node and translated IDs separately.
>> Update all callers accordingly.
>>
>> Subsequent patch will make use of the args_count field in
>> struct of_phandle_args.
>>
>> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>>  drivers/iommu/of_iommu.c              |  2 +-
>>  drivers/of/base.c                     | 37 +++++++++++++++++------------------
>>  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
>>  drivers/pci/controller/pcie-apple.c   |  4 +++-
>>  drivers/xen/grant-dma-ops.c           |  2 +-
>>  include/linux/of.h                    | 21 +++++++++++++-------
>>  6 files changed, 44 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
>> index a0937b7b3c4d..e1d4b37d200d 100644
>> --- a/drivers/pci/controller/pcie-apple.c
>> +++ b/drivers/pci/controller/pcie-apple.c
>> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  {
>>  	u32 sid, rid = pci_dev_id(pdev);
>>  	struct apple_pcie_port *port;
>> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
> 
> Hmm, I didn't notice this. Parsing functions are expected to ignore
> of_phandle_args before the parsing. So passing .args_count = 1 is
> strange.
> 

You're right, This is not required. I'll remove these initializations in next 
series.

Thanks,
Vijay

>>  	int idx, err;
>>  
>>  	port = apple_pcie_get_port(pdev);
> 

