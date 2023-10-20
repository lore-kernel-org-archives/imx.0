Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF071802E
	for <imx@lists.linux.dev>; Fri, 20 Oct 2023 20:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/HSIJ5G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697834545; x=1729370545;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ecmwPBJzBiIjr2BFx4ObYSrBmisVgxOUXbZjBhAlk5g=;
  b=C/HSIJ5GHDW89v4s2qMaww54PbIQfcu6h9XqKyhn9RLkIFCyYzLjmJGk
   KA7EeJov27WQJoTuT/bgWAzfC0iirhO6cX7mxKGtEToIwpW1bZV3/Uvje
   NR+gOeY1bmWEyUe3WBn58i2XK7JSV640B/a2gJE2Jo4uPGShrKEZlxxIJ
   24qBnc52P26fdB91kKKQU4vCbOzGP3g33GCmOLg1RfZhtLUMm/qEABZuI
   RUaHLJXPVxaE+YhIAVFcmfMZD3dx0SZoko0xB8mYzNUrjLsvWKMnZOQ77
   lnG/mXEMAX3BtGwez7aHI1uLI0CnmNMYyv3KqwUKw9msffphJFqgnd9pa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="389425164"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="389425164"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 13:42:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="881177232"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="881177232"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 13:42:24 -0700
Received: from [10.252.63.39] (jbyczkow-MOBL1.ger.corp.intel.com [10.252.63.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 816E1580D4F;
	Fri, 20 Oct 2023 13:42:22 -0700 (PDT)
Message-ID: <86955c20-22e6-0d02-813f-02f0096c2819@linux.intel.com>
Date: Fri, 20 Oct 2023 22:42:20 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/6] i3c: master: add enable(disable) hot join in sys
 entry
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, zbigniew.lukwinski@linux.intel.com
References: <20231018205929.3435110-1-Frank.Li@nxp.com>
 <20231018205929.3435110-2-Frank.Li@nxp.com>
 <57efe6de-cf65-32ed-fd1e-a388e1676c70@linux.intel.com>
 <20231020154528.2f5f68f5@xps-13>
 <ZTKMyW939rB6sSKq@lizhi-Precision-Tower-5810>
 <20231020163348.1752167d@xps-13>
 <8a7ac52e-f102-6f5e-35ab-217e6ecc6ba5@linux.intel.com>
 <20231020202519b2449707@mail.local>
 <ZTLktpI2rbAT4Ztb@lizhi-Precision-Tower-5810>
From: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>
In-Reply-To: <ZTLktpI2rbAT4Ztb@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/2023 10:36 PM, Frank Li wrote:
> On Fri, Oct 20, 2023 at 10:25:19PM +0200, Alexandre Belloni wrote:
>> On 20/10/2023 17:12:53+0200, Zbigniew, Lukwinski wrote:
>>> On 10/20/2023 4:33 PM, Miquel Raynal wrote:
>>>> Hi Frank,
>>>>
>>>> Frank.li@nxp.com  wrote on Fri, 20 Oct 2023 10:20:57 -0400:
>>>>
>>>>> On Fri, Oct 20, 2023 at 03:45:28PM +0200, Miquel Raynal wrote:
>>>>>> Hi Lukwinski,
>>>>>>
>>>>>> zbigniew.lukwinski@linux.intel.com  wrote on Fri, 20 Oct 2023 10:55:27
>>>>>> +0200:
>>>>>>> On 10/18/2023 10:59 PM, Frank Li wrote:
>>>>>>>> Add hotjoin entry in sys file system allow user enable/disable hotjoin
>>>>>>>> feature.
>>>>>>>>
>>>>>>>> Add (*enable(disable)_hotjoin)() to i3c_master_controller_ops.
>>>>>>>> Add api i3c_master_enable(disable)_hotjoin();
>>>>>>> What is the use case for having HJ enable knob in sysfs available for user space other than for debug stuff? In other words, does user space really need to enable/disable HJ in runtime for other reason but debug? If it is only for debug maybe it  could be move to debugFS?
>>>>>> I don't think hotjoin should be considered as a debug feature. The
>>>>>> problem here is the power consumption which is higher if you enable
>>>>>> this feature (you need to keep everything clocked and ready to handle
>>>>>> an IBI) whereas if your design is "fixed" (more like an I2C bus) you
>>>>>> may save power by disabling this feature.
>>>>>>
>>>>>> A module parameter does not fit here because it's a per-bus
>>>>>> configuration.
>>>>> I agree. sys entry is more flexiable. and let controller choose better
>>>>> power saving policy for difference user case.
>>>> Maybe it's not the first time this case is faced, would you mind
>>>> including power management maintainers in this discussion? Perhaps they
>>>> might have pointers or even have the solution already.
>>>
>>> I did not mind HJ as debug feature. But enabling / disabling the HJ sounds
>>> to me like debug option.
>>>
>>> So the flow you are considering here is like this:?
>>>
>>>      1. system boot with HJ enabled, so HJ works during initial bus
>>>         discovery
>>>      2. some entity in user space decides to disable HJ because power
>>>         consumption?
>>>      3. some entity in use space decide some time later to re-enable HJ
>>>         because some reason?
>>>
>>> I am just wondering whether there is real use case when you starts with HJ
>>> enabled and than disable it
> 
> I think it is validate user case. Assume a I3C GPS device, user only use
> it when open map. Before map application open, enable i3c hotjoin and
> power on GPS module. After map application close, disable i3c hotjoin and
> power off GPS module.
> 
Got it. I think we are on the same page. Thanks for explanations!
> Frank
> 
>>>
>>> in runtime or start with HJ disabled and enable it in runtime. If you are
>>> taking care about power saving
>>>
>>>   let's keep HJ disabled all the time. Default state for HJ could be
>>> controlled by DT entry.
>>>
>>
>> This would be HW configuration and not HW description.
> 
> Yes, DT maintainer may not accept this entry because it is not HW
> description.
> 
Sure. Makes sense.
>>
>>
>>>
>>>> Thanks,
>>>> Miquèl
>>
>> -- 
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com

