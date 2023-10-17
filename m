Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917CF1FA2
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 06:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdE9HVVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697523047; x=1729059047;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=fvSUNe12MrPApyrnvzaikJXkNdd9PaAh1gP0bEv8+3k=;
  b=DdE9HVVGENs+zH84o9Ssuu9o9g+zAdqmmrTq4ugCy7DzOKeSdB9pt1vP
   UanubGxK7MaS8ULWliGjC1pyTZejoDXGSSiUo9h8TlEET5Hr2oDOqrVFX
   XlJrWEmZubHJpnDH8YqkqOiLqK2IZzl/uwMA8rqfhI/gzu7fCXRHl8mko
   M1rTgoNxeT4uXluLRayyWA/dgBNnWzX+5KLMF/m69i4OzGd8pP/YSD3N3
   sXV+azxoi7JYa+m5p7N598iUC1k7KWm9vdjVV9pHHCUMMp3jiLuv9Zzkz
   O3P7JysAX05mQRNGLSkEiSjafD1HLmCj/CoZPhy5VUP3N9Et8I3JnLHW4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="365059481"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="365059481"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 23:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="826303833"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="826303833"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by fmsmga004.fm.intel.com with ESMTP; 16 Oct 2023 23:10:32 -0700
Message-ID: <696dbfdc-1b08-446d-8983-dda09d861f59@linux.intel.com>
Date: Tue, 17 Oct 2023 09:10:31 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] i3c: add actual in i3c_priv_xfer
To: Frank Li <Frank.Li@nxp.com>, alexandre.belloni@bootlin.com,
 miquel.raynal@bootlin.com, conor.culhane@silvaco.com, joe@perches.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20231016154632.2851957-1-Frank.Li@nxp.com>
 <20231016154632.2851957-3-Frank.Li@nxp.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20231016154632.2851957-3-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

On 10/16/23 18:46, Frank Li wrote:
> In MIPI I3C Specification:
> 
> "Ninth Bit of SDR Target Returned (Read) Data as End-of-Data: In I2C, the
> ninth Data bit from Target to Controller is an ACK by the Controller. By
> contrast, in I3C this bit allows the Target to end a Read, and allows the
> Controller to Abort a Read. In SDR terms, the ninth bit of Read data is
> referred to as the T-Bit (for ‘Transition’)"
> 
> I3C allow devices early terminate data transfer. So need "actual" field to
> indicate how much get by i3c_priv_xfer.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   include/linux/i3c/device.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index 90fa83464f00..f2fa7ee5d96d 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -66,6 +66,7 @@ struct i3c_priv_xfer {
>   		void *in;
>   		const void *out;
>   	} data;
> +	u16 actual;
>   	enum i3c_error_code err;
>   };
>   
Would this be more clear if named as "actual_len" and put next after 
"len" field in this structure? Also kerneldoc comment is missing.
