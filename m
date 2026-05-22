Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F523B95F6
	for <imx@lists.linux.dev>; Fri, 22 May 2026 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443237; cv=none; b=E8cgR/6uMFKhVzVeNDn+FK/C1MIek7t8FGOCy4I1u9ENsSfWva+6HbaFXZfyNpF7jrS3C8b3No3nTi1x2YKaMZZjQYchgWrqsBO8zZqKHa9v4U6iqiimVrNQ3dL67SNUMoZ2wCOtJKULMfYd2w2DOM31dYwBU0eYYIIyj8/y7SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443237; c=relaxed/simple;
	bh=o9GC/6ank0uxJw5NfpsZY/9YO+co0ljwtXYLI4sQCGs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=b9/srXdRNawJIc6eVCLdfXacQyguCyWfI9BiAmeEPLWLm2qXW8xD2E4FYTgTToj9MzaiY/oDsoGPcG4rRcWohzXWHmxudcLiAirIQCcgm9SM8e/ZYFaPqHvJDORkr4ddiDOQqtwPLl0og283HzcrRa0jXa6SwT1olr0Q9wf9tAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdimGnyP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PALReV2N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdimGnyP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PALReV2N"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8VGga3532135
	for <imx@lists.linux.dev>; Fri, 22 May 2026 09:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BiA+pl3Inn69b7wyI+hzfTnftF/NDzuqEqEnr7gbUrI=; b=KdimGnyPsjDMWGCo
	YburTCoVlqDHirZ4cQXWfpFh5+HDeSBFwcw8lNsv6Q4JbquDJ72kX4UQ02gjTpsR
	ErpJY/9t0thu8/ebKBIYsDDa4skf68W2Tq3aeZqnsy7AyvRLdFuezCYVBda5ms3j
	/nqrmasBjBkirux/efqcO93rn0xEhTKsubIrQdtqjVQrAuteMoNj+L8kS8tGLcNS
	GrQft/68IQfmbDgx+zqFGxOC/MTRtsgjxTzNhT9DOU04OMV9TqIRM8em3PShTdHU
	2tir4aCIzrp8QVbv/Ip1o+oz61zIfJT8+c1aALlV9SdCQIpUvSx97Z2hZnSuGesU
	k+Q1Gg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gvf7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 22 May 2026 09:47:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366ded3bed0so4975472a91.0
        for <imx@lists.linux.dev>; Fri, 22 May 2026 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779443234; x=1780048034; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BiA+pl3Inn69b7wyI+hzfTnftF/NDzuqEqEnr7gbUrI=;
        b=PALReV2NWmgqH7NjIk9zgKyEWp/f/cktF/QrCKBhxddURvrTDuGEOqCkbEMWkZDZV2
         eRKwSHKKTunUooo0h4ZKMB+stbcI4LS886mywmpJmK0miV6bY+AR3tlAt6Ot895eXO7I
         pdhzEalXYPB040XDi3XwXsBuzqmGR9cHKjn948j1dDYaossAAcLO/sxxCdNoMbxatm29
         ZpCUP5zxwhVljgIZYydGxluIFEj+vK1ppvgrfr3QyJX+Jp5VTKBmxbMGCOD2tgsmyfFO
         3h+2dNqmsl8xIPrsHtM10E//ZJwX8WARYyuvuSkv7FVdJ4hfavak92jO9kD3h0vjNydr
         ScTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443234; x=1780048034;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiA+pl3Inn69b7wyI+hzfTnftF/NDzuqEqEnr7gbUrI=;
        b=XomUrjm7QOiNpylYutiXLmxZfGyftQPYuYSuDwRJUyIqcm/yVWdtrqbGp5v+6uyKze
         ZAZWZH82nhtzHRWMTmdksPM7+nft8/Od4LcoMFtK3wPIF3h0hRGWJVCTSn3/0QFjdkov
         2MJaLbW9mPV+fUdXF5EQ9+BZk7pMPqvbyjd7l41khfPeYbRBYTJCh0l1E6BszNl9xcbs
         29VQ4wy6MZh5n3Wcj29Qqw7zYa/TJdPjMVOtr9I7kQLw3XyQlQpTZ2323JgIVudZhwVh
         boiuKapfP/dfzYtDMUwd7cvkgEyxiw+VuhYn+PW6X7y2dSJZNenKbCbxakVYokx2vkDa
         xUOw==
X-Gm-Message-State: AOJu0YwXLhjpnYpX/Stxr9AT9VejpLtieZ/7PvZA0o/ROX7EVfrwwcpK
	hutha8wvLuWd6p0Mt3uwC5jmcbqpdmxUvpLTDtW58EO4x6Akal0r9nXVEPSgafROgB16wPMUDsV
	muOjijZXp00J8I52u8PLc5NoTDbOBQYXcgXeV9kLRrI8sMPU3/nT+bis=
X-Gm-Gg: Acq92OGgwqLlRpHLDmkUBrISob8smb4CsP2i7O1Ei/j8Sl60YU1U+pMLwe6GrksUqW+
	mbnEvCfeZcqz3jJIQBtod7UnlRAieP8VoNJUfLq4hM1YBvdy7zvlz7buRmH7pUJNMqXo+oGY8Ex
	6NNIYWgIRRkYRVBLfXLOC3TFL/JmPFMjnPXSTeOyViYwI8T5r+D/Wm7G/ZiDItWiixpiR8d+g7g
	9NlWSbADD3Kqabunts0xmWxOVDzE/92san/6S1xOuz0Hrguma6eDS1dHiYzi7IGjBNjFcHO1kho
	Z4/6StoY0oY78y6Nn6mjSMBb0Vz7soespND1i/SyUe33SC5XY6UhxN2blHKedADWxmxgEIIHFig
	bW2b42A1RNvPS8Ok850gutcuNSOtS3pn9ovRM9z2JV7/Y07K2UBvNaiPg
X-Received: by 2002:a17:90b:2d44:b0:369:b2c9:a0a with SMTP id 98e67ed59e1d1-36a47ab457fmr5100566a91.13.1779443234179;
        Fri, 22 May 2026 02:47:14 -0700 (PDT)
X-Received: by 2002:a17:90b:2d44:b0:369:b2c9:a0a with SMTP id 98e67ed59e1d1-36a47ab457fmr5100525a91.13.1779443233648;
        Fri, 22 May 2026 02:47:13 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852028fecbsm1062574a12.1.2026.05.22.02.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:47:13 -0700 (PDT)
Message-ID: <a3c4a161-8222-4b57-8328-b1106b1b854f@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:17:09 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 3/3] of: Respect #{iommu,msi}-cells in maps
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, linux-pci@vger.kernel.org, Frank.Li@kernel.org
References: <20260520-parse_iommu_cells-v15-3-b5f99ad4e7e8@oss.qualcomm.com>
 <20260520092923.0EDD11F000E9@smtp.kernel.org>
 <4eab296c-1b5f-4767-9e66-22af3474bf67@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4eab296c-1b5f-4767-9e66-22af3474bf67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a102622 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=7_kb8tBQChwwwGt_9_wA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: VMS32fP4cFOeZpVztCVjKSy2UbSc-IKj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NyBTYWx0ZWRfX6KF8b1MiVorG
 MDPfShmTw7yNHqvwwnh4cBTqcDM/IXnJv0Q6scF9DrGuT6GZeb7P81B7nHJ/ha2QbvgAyh8O07S
 g0baFSNCh7UCDF0qxnfXtlzEi28KBTM7ATYsMuBuQyaLmEbycmauznjAaI2T+p86L3phBYUZnZm
 zj3NOTlWIvS9jo1dxv+EZ/yecHv/kr92wMlOPXwoDvP3UHXZMCpDlKmgwt2uJ41RwkCyAjxL2FW
 eetsMhpIzaGQOlHWhe05is7TEm/vNaz32ovnqQBZ2nlnT4QYhNlU/2S+FY41gXe5G1NyYCCb40C
 KwwXkSFX+2AiJ2sNy/KTDt/aStjbSOMpXrQbH8ijDcfsvjUF8+C55NTx1LzTy37Ofb6TiGgLKwv
 rpwxN25lgCgMJJCH8iHO6blgMI/GO/J/ivlaKtFMxoRcvmi6Uiz4zxF+OMA2e8vNX4gPc/I9vC9
 BMarbSilMusmO+IWZkw==
X-Proofpoint-GUID: VMS32fP4cFOeZpVztCVjKSy2UbSc-IKj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220097



On 5/21/2026 6:47 PM, Vijayanand Jitta wrote:
> 
> 
> On 5/20/2026 2:59 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] Strict requirement for `#iommu-cells` or `#msi-cells` breaks MSI allocations on standard-compliant controllers.
>> - [High] Array desynchronization when parsing legacy 0-cell maps padded to 4 words per entry.
>> --
>>
>> commit 23cece64ecb1dcea6290dbab34facbdac53ff293
>> Author: Robin Murphy <robin.murphy@arm.com>
>> Date:   Wed May 20 08:02:42 2026 +0000
>>
>> of: Respect #{iommu,msi}-cells in maps
>>
>> This commit adds support for parsing target nodes' #cells values for
>> iommu-map and msi-map properties, instead of assuming output specifiers
>> always have exactly 1 cell. It updates of_map_id() to parse multi-cell and
>> 0-cell output specifiers and reflect the actual number of output specifier
>> cells.
>>
>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>> index d658c26201353..f436e26763818 100644
>>> --- a/drivers/of/base.c
>>> +++ b/drivers/of/base.c
>>
>> [ ... ]
>>
>>> @@ -2176,39 +2206,93 @@ int of_map_id(const struct device_node *np, u32 id,
>>
>> [ ... ]
>>
>>> +		phandle = be32_to_cpup(map + offset + 1);
>>>  		phandle_node = of_find_node_by_phandle(phandle);
>>>  		if (!phandle_node)
>>>  			return -ENODEV;
>>>  
>>> +		if (bad_map) {
>>> +			cells = 1;
>>> +		} else if (of_property_read_u32(phandle_node, cells_name, &cells)) {
>>> +			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
>>> +			of_node_put(phandle_node);
>>> +			return -EINVAL;
>>> +		}
>>
>> [Severity: High]
>> Does this strict requirement for #iommu-cells or #msi-cells break MSI
>> allocations on standard-compliant controllers?
>>
>> Several MSI controllers validly lack a #msi-cells property. For instance,
>> arm,gic-v2m-frame nodes do not require it. In
>> arch/arm64/boot/dts/qcom/ipq5018.dtsi, the pcie0 node defines:
>>
>> msi-map = <0x0 &v2m0 0x0 0xff8>;
>>
>> but v2m0 does not have #msi-cells.
>>
>> Prior to this patch, of_map_id() implicitly consumed 4 words per entry and
>> succeeded. Will it now fail to find #msi-cells, print an error, and
>> return -EINVAL, propagating the error through of_msi_xlate() and breaking
>> MSI initialization on affected platforms?
>>
> 
> I see both arch/arm64/boot/dts/qcom/ipq5018.dtsi and ipq5332.dtsi both have
> msi-map pointing to arm,gic-v2m-frame nodes without #msi-cells.
> 
> The new strict pr_err + -EINVAL breaks MSI on these platforms. I'll fix this
> in v16 by defaulting  cells to '1' when #msi-cells is absent.
> 
> 
>>> +
>>> +		if (cells > MAX_PHANDLE_ARGS) {
>>
>> [ ... ]
>>
>>> +		if (map_len - offset < 3 + cells) {
>>> +			of_node_put(phandle_node);
>>> +			goto err_map_len;
>>> +		}
>>> +
>>> +		out_base = map + offset + 2;
>>> +		offset += 3 + cells;
>>
>> [Severity: High]
>> Could this cause array desynchronization when parsing legacy 0-cell maps
>> that were padded to 4 words per entry?
>>
>> Prior to this patch, of_map_id() mandated that the map property length must
>> be a multiple of 16 bytes:
>>
>> if (!map_len || map_len % (4 * sizeof(*map)))
>>     return -EINVAL;
>>
>> Consequently, if a legacy device tree targeted an MSI controller that
>> explicitly defined #msi-cells = <0> (such as RISC-V IMSIC nodes), it was
>> structurally forced to pad the 3-word map entry with a dummy 4th word to
>> satisfy the kernel's length check.
>>
>> Since the new logic computes the entry stride dynamically as 3 + cells,
>> when parsing a legacy padded map with cells=0, does the code advance by 3
>> and incorrectly interpret the 4th dummy word of the first entry as the
>> id_base of the second entry?
>>
> 
> I see there is no real in-tree DT combines #msi-cells = <0> or #iommu-cells = <0>
> with msi-map/iommu-map. All in-tree #msi-cells = <0> nodes (RISC-V IMSIC) use msi-parent.
> If such DTs appear in the future, they would need to use the new 3-word entry format
> (without the old padding), which is correct per the binding spec.
> 
> So, No changes are needed here.
> 
> Thanks,
> Vijay
> 

Please do let me know if there are any further comments. I'll address those
as well as part of v16.

Thanks,
Vijay
