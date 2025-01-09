Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946392F2D
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736412627; cv=none; b=PnDbx3IvraYIdCZhOwp+QJmO7+SAxETpkSwrpGoTKhtUlVIrfQHMEwmXUYhjMNrbKYs6EdShg4cWktVrw954K5nqdQFJI/b2L3AnqRI8gjAbNlNFzduwVkJ04cC27LSv39pSZSZC0MK+bVEGhyljSj4ZbPk0EO2lWrvX6rGhNTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736412627; c=relaxed/simple;
	bh=ptd6YEnRpCQ0xymGJkst6f2eugLHYzZkYTtQZEFUmKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Vu+yMju+XwsytINgHStMNDLL6+14q9gvmLHz2FzWiz3eQqnPGIDSLTtpVbcXQJ1CxdhdgYi+7HloaLN3enBWqpwO8lZKN1Nc14STniGMt+KkeT0Dqm4lAn8erYppNBjxTZTZdNm5o0wjREHtNPXT5y9vSW8mPeLUK/ToBQyqwww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RJf6at5/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RJf6at5/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509418Ak030410;
	Thu, 9 Jan 2025 08:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	he/XnQHzrk94R5LspwWCWwvtkBuM8+4yqBzwWYA4MwM=; b=RJf6at5/GdAFzjur
	Pga4SWm/90TWSI8aLRrCLImtEmNVK0jv1omfYiYR8RmOUyP+DQqhMQCgznO4Nh5/
	IGfKe/cKXo/pLxGAumxrkIRHR7LrFx/4fgW4pXcImconcEiAPGweGFQ0/wGkNx1L
	/Vv9595F37VvtPUAkV9dFz+H5ntRXLMJkoojn8oFEHOq42JJ8C1yd0NelyVdfqGP
	VZ9K30OqC1nuJSkPo5hR5RAUuGB3RDBZ5NV0NZCQPUoZWaLpQFzjpqEAiH+zU4HW
	UMjsiIO7yZ9M+vEZC0uKWcoLxmtGBA/6imYwIGLksPYQLhst5BQJLKQoNvnpWxJN
	R6fWzg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442727rm3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 08:50:20 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5098oJbP004724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 08:50:19 GMT
Received: from [10.216.26.158] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 00:50:16 -0800
Message-ID: <9d0dac6c-b9b2-4852-bd42-8aa14124b24c@quicinc.com>
Date: Thu, 9 Jan 2025 14:20:11 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] i3c: master: Fix missing 'ret' assignment in
 set_speed()
To: Frank Li <Frank.Li@nxp.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Carlos Song <carlos.song@nxp.com>,
        Miquel
 Raynal <miquel.raynal@bootlin.com>,
        "moderated list:I3C SUBSYSTEM"
	<linux-i3c@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
CC: <imx@lists.linux.dev>
References: <20250108225533.915334-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250108225533.915334-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zLUHJtMqEoSGYBRjPKlAYeWuCXlRxnFk
X-Proofpoint-ORIG-GUID: zLUHJtMqEoSGYBRjPKlAYeWuCXlRxnFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090072

Hi Frank, change looks good to me.

On 1/9/2025 4:25 AM, Frank Li wrote:
> Fix a probe failure in the i3c master driver that occurs when no i3c
> devices are connected to the bus.
> 
> The issue arises in `i3c_master_bus_init()` where the `ret` value is not
> updated after calling `master->ops->set_speed()`. If no devices are
> present, `ret` remains set to `I3C_ERROR_M2`, causing the code to
> incorrectly proceed to `err_bus_cleanup`.
> 
> Cc: stable@vger.kernel.org
> Fixes: aef79e189ba2 ("i3c: master: support to adjust first broadcast address speed")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/i3c/master.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 42310c9a00c2d..53ab814b676ff 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1919,7 +1919,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>   		goto err_bus_cleanup;
>   
>   	if (master->ops->set_speed) {
> -		master->ops->set_speed(master, I3C_OPEN_DRAIN_NORMAL_SPEED);
> +		ret = master->ops->set_speed(master, I3C_OPEN_DRAIN_NORMAL_SPEED);
>   		if (ret)
>   			goto err_bus_cleanup;
>   	}
Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
