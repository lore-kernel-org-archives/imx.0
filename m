Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230C93D394
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 08:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzOvyc3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697531618; x=1729067618;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=MxayT2/XEWdFuARMII+EG5lLXg5UMsqpoavndXRXyTw=;
  b=UzOvyc3bcCh4vIhBPt8hOwglkAuLMPasGxNDKb16omSgPUkwDNsoHs7P
   lqvdNJ9L2HxdhVnAvQ/JrT156cojkOS3B6ij6DJC4k0C4cKL9CCzLkUPe
   WVO/TRfHYdoDtNwTy7O2wB9MuQSlZEOngY5FiTMxsrGjo2PTX9b5xdzTp
   iM3jzRjWvLh4GLkjiRN0eT3aV7tC9/hNf9cagMUgresSZmAquhq/mTnLX
   4gwrfFaEoEfDEeAAzAmYbzMkbG4EPFjw6b0TlmpscWGO7vJdVv4XTL9mA
   Jl4sTmpgtkmwVOOH3NsJIn/es6pJ9rIwo3cnntNTflQxOZamni4BCAeV+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="384608512"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="384608512"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 01:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="826353237"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="826353237"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2023 01:33:35 -0700
Message-ID: <af35a533-2126-4a61-a6cd-31ed1e615f2b@linux.intel.com>
Date: Tue, 17 Oct 2023 11:33:34 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] i3c: master: svc return actual transfer data len
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, alexandre.belloni@bootlin.com,
 miquel.raynal@bootlin.com, conor.culhane@silvaco.com, joe@perches.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20231016154632.2851957-1-Frank.Li@nxp.com>
 <20231016154632.2851957-5-Frank.Li@nxp.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20231016154632.2851957-5-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 10/16/23 18:46, Frank Li wrote:
> I3C allow devices early terminate data transfer. So set "actual" to
> indicate how much data get by i3c_priv_xfer.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/i3c/master/svc-i3c-master.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 3570b709cf60..444825aafa6f 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -138,6 +138,7 @@ struct svc_i3c_cmd {
>   	const void *out;
>   	unsigned int len;
>   	unsigned int actual_len;
> +	struct i3c_priv_xfer *xfer;
>   	bool continued;
>   };
>   
I'm thinking would it make sense to combine this and previous patch by 
removing the read_len/actual_len variable from this structure and use 
the added one (by the patch 2/5) from "struct i3c_priv_xfer" directly?
