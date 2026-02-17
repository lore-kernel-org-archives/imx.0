Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7BE36C0DC
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771336479; cv=none; b=MnyI1psuK2lxamaZwXQPMAAzmaPExEPCytNA+I16QUPys8+n3EAfhbnCsIgK95BZzsTvl1SuVoT0tF9t6LP9jVGhurKf08+VHgk8J8t7U3rPxGFAoSFa+pCHYyXXmuXWtch9lqqMNAjHk70YPPg5UtE5DTmh9BYe2qihEH1bZnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771336479; c=relaxed/simple;
	bh=Pr5awygYQuh7iIYR86mN2Hg8u0umXUaK380MImSUGhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZVvdjgTisQXlzIPmgNlSEN2NoLPw8TsKXHaqyF3VLhS5Z/Xv4aZ+z+WNgGhaWJoKlpNRe22MygHNzUWIV8Is52hClb7zzrbiVCVN/y+lGBS1ehHLjM0FJ4Q9GOUsTQbTHA8iQTmKkHeQXlx0EbZ2g1EwJgG9YCTQHw3Z/UHkdiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kP9XGTI4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kP9XGTI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771336478; x=1802872478;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pr5awygYQuh7iIYR86mN2Hg8u0umXUaK380MImSUGhc=;
  b=kP9XGTI4CxG2JBD9WHjlIoXo2vWgpTd5fwa9n07oYnY8DVU784sHtSwp
   g0xKAuxKj+MuHny9q+zAuNBmHFnjYTUqoBcTX3U7K/AnffwW8edt2Chkp
   cKUv6EtQLYOhVsAw/j3af7Zon49nWzTUxsp9i+7I9RbfoL8POM9+s+7k1
   Kp+JGqH0nHyoGmvKoPUmwSFD2HhPTSP826jR64wLRDQgs0P0NhItrTeqr
   +YNDl0GLvNCA3kf4jXYyQL2u6aALPqEXz6BYR40tukCVJkYMBEq6bykLq
   onjbEmu/kwJC8u2w4721UXwTHdERVAIQ7Yrc089h4UciiBue1+GeAH0dD
   A==;
X-CSE-ConnectionGUID: d+QB4zD6Tyi4LVlAEk07dQ==
X-CSE-MsgGUID: AzctY7ISRTeVpqe2FzjuyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72292098"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72292098"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 05:54:38 -0800
X-CSE-ConnectionGUID: QvCnT4lATxuWcPafI9z0ng==
X-CSE-MsgGUID: RsN5tqERQBCTRUqxEnvzHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="218421153"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by fmviesa005.fm.intel.com with ESMTP; 17 Feb 2026 05:54:30 -0800
Received: from lincoln.igk.intel.com (lincoln.igk.intel.com [10.102.21.235])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 7127B28795;
	Tue, 17 Feb 2026 13:54:27 +0000 (GMT)
From: Larysa Zaremba <larysa.zaremba@intel.com>
To: bpf@vger.kernel.org
Cc: Larysa Zaremba <larysa.zaremba@intel.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	"Bastien Curutchet (eBPF Foundation)" <bastien.curutchet@bootlin.com>,
	Tushar Vyavahare <tushar.vyavahare@intel.com>,
	Jason Xing <kernelxing@tencent.com>,
	=?UTF-8?q?Ricardo=20B=2E=20Marli=C3=A8re?= <rbm@suse.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Toke Hoiland-Jorgensen <toke@redhat.com>,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-kselftest@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Dragos Tatulea <dtatulea@nvidia.com>
Subject: [PATCH bpf v3 2/9] xsk: introduce helper to determine rxq->frag_size
Date: Tue, 17 Feb 2026 14:24:40 +0100
Message-ID: <20260217132450.1936200-3-larysa.zaremba@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260217132450.1936200-1-larysa.zaremba@intel.com>
References: <20260217132450.1936200-1-larysa.zaremba@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rxq->frag_size is basically a step between consecutive strictly aligned
frames. In ZC mode, chunk size fits exactly, but if chunks are unaligned,
there is no safe way to determine accessible space to grow tailroom.

Report frag_size to be zero, if chunks are unaligned, chunk_size otherwise.

Fixes: 24ea50127ecf ("xsk: support mbuf on ZC RX")
Signed-off-by: Larysa Zaremba <larysa.zaremba@intel.com>
---
 include/net/xdp_sock_drv.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/net/xdp_sock_drv.h b/include/net/xdp_sock_drv.h
index 242e34f771cc..09d972f4bd60 100644
--- a/include/net/xdp_sock_drv.h
+++ b/include/net/xdp_sock_drv.h
@@ -51,6 +51,11 @@ static inline u32 xsk_pool_get_rx_frame_size(struct xsk_buff_pool *pool)
 	return xsk_pool_get_chunk_size(pool) - xsk_pool_get_headroom(pool);
 }
 
+static inline u32 xsk_pool_get_rx_frag_step(struct xsk_buff_pool *pool)
+{
+	return pool->unaligned ? 0 : xsk_pool_get_chunk_size(pool);
+}
+
 static inline void xsk_pool_set_rxq_info(struct xsk_buff_pool *pool,
 					 struct xdp_rxq_info *rxq)
 {
@@ -337,6 +342,11 @@ static inline u32 xsk_pool_get_rx_frame_size(struct xsk_buff_pool *pool)
 	return 0;
 }
 
+static inline u32 xsk_pool_get_rx_frag_step(struct xsk_buff_pool *pool)
+{
+	return 0;
+}
+
 static inline void xsk_pool_set_rxq_info(struct xsk_buff_pool *pool,
 					 struct xdp_rxq_info *rxq)
 {
-- 
2.52.0

