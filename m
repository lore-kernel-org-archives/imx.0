Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD53521CA17
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 13:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739798631; cv=none; b=irYlzgP7BjKlm2fqxHFHrwq4OawHgOO6P6A1RGxZln98g32mPuQXPhdOhRp0GKXwIVNkYuBRSUn8sA9oiGb3iGgJN1nFtUJ31RjO6nXLsl30dcfbRJvoGsS5oLCqCZMaqGtGR4oE3UEo3yvZ/K0ovzEblKsxpqjSTTCl6rrhY64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739798631; c=relaxed/simple;
	bh=5jI7yAwfnD29sHW7cjA1e58vatW5I20of910rii2ypU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGINllIBWoQtfinMewLZ6qNBdnURhl20LWV1vabIpcW/3a6gl3C4Bgl13Jl0kF/UsqliH6FcGpuvf7FQSRqzb4heb2qp25P4jgZMkyUcKLl1AUJ9QVaNO6p3j+IV8Clp+U5v18jzNdufvY9KeKJRCPquVKPOIwp316Ew+GfMVfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9iQ1ZJe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9iQ1ZJe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739798629; x=1771334629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5jI7yAwfnD29sHW7cjA1e58vatW5I20of910rii2ypU=;
  b=i9iQ1ZJeOoHGRkvLRrY21cwq1w/zxcIz9UDKr9k2lPq2M8CQZJyQfu0n
   TcrQQE+jqUu5D1Y2KBA/U9DQ+BhxFBT4wX/kZMay7hMDzbkNzB1bTqEZK
   gQDM/bJ1vVVAFSGw8LX512sMBWsbxTbT6FggWWH3YZwA5Y4rkVTjBv9J/
   3ElDjbE4VhYWMBsGBAls3hY2FATsmlEhCE9yadeiv/RMPQm0gAGhWG2at
   HVag4RFi9pV6xViXhyoxGLG9e8NzCCauO+30duS+gyM5/hJzX4ZWQ+Lxx
   ghZdAtx3pkKpK1tGa4dGVkpnZrQozCSc5n/kL+WD2BFeneJnB7Mkpsr/7
   w==;
X-CSE-ConnectionGUID: ZZK0fm8AT8SD5XmobNsWCg==
X-CSE-MsgGUID: WcSjeLEWRIyoGhUCdlVROA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44407670"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="44407670"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 05:23:49 -0800
X-CSE-ConnectionGUID: dravQctqRiSK8gousaJ5GQ==
X-CSE-MsgGUID: itWmg63nSVmT3xLBpY/ocw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="119123696"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 05:23:46 -0800
Date: Mon, 17 Feb 2025 14:20:05 +0100
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, ioana.ciornei@nxp.com,
	yangbo.lu@nxp.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net 2/8] net: enetc: correct the tx_swbd statistics
Message-ID: <Z7M3heKHsQBvIRBi@mev-dev.igk.intel.com>
References: <20250217093906.506214-1-wei.fang@nxp.com>
 <20250217093906.506214-3-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217093906.506214-3-wei.fang@nxp.com>

On Mon, Feb 17, 2025 at 05:39:00PM +0800, Wei Fang wrote:
> When creating a TSO header, if the skb is VLAN tagged, the extended BD
> will be used and the 'count' should be increased by 2 instead of 1.
> Otherwise, when an error occurs, less tx_swbd will be freed than the
> actual number.
> 
> Fixes: fb8629e2cbfc ("net: enetc: add support for software TSO")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/enetc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
> index f7bc2fc33a76..0a1cea368280 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -759,6 +759,7 @@ static int enetc_lso_hw_offload(struct enetc_bdr *tx_ring, struct sk_buff *skb)
>  static int enetc_map_tx_tso_buffs(struct enetc_bdr *tx_ring, struct sk_buff *skb)
>  {
>  	struct enetc_ndev_priv *priv = netdev_priv(tx_ring->ndev);
> +	bool ext_bd = skb_vlan_tag_present(skb);
>  	int hdr_len, total_len, data_len;
>  	struct enetc_tx_swbd *tx_swbd;
>  	union enetc_tx_bd *txbd;
> @@ -792,7 +793,7 @@ static int enetc_map_tx_tso_buffs(struct enetc_bdr *tx_ring, struct sk_buff *skb
>  		csum = enetc_tso_hdr_csum(&tso, skb, hdr, hdr_len, &pos);
>  		enetc_map_tx_tso_hdr(tx_ring, skb, tx_swbd, txbd, &i, hdr_len, data_len);
>  		bd_data_num = 0;
> -		count++;
> +		count += ext_bd ? 2 : 1;

Looks fine, beside you need to fix the unroll like in patch 1.
Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>


>  
>  		while (data_len > 0) {
>  			int size;
> -- 
> 2.34.1
