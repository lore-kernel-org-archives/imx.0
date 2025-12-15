Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BED329E6D;
	Mon, 15 Dec 2025 03:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765770718; cv=none; b=NT2EVkW7CbLsVBVgZn5zQGyf7Mv/SpAeky3zrZUQQg91DCR2Eyq3l5TaNSTGT0NDyo4Zjw/cNX1/l4Q0UBdHEjBmw47pd1JZFhIUs86tQkXOv/eEjIHQ9u+HkEPMiN+4xpFJ4Pahq+xo890zmd/n2UjhqLfqKGlwNM7fUfQfBGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765770718; c=relaxed/simple;
	bh=Tv+6WHQtcQWkl905f+3Iu7W12IYA8HG6+Bx0cStnWM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkfTuc7JODRqW4GrwZJ+o2o2yOMJFAiK5wEE5kDfdch+2L4Jyd4lCyKSKeuoEOjD1xairh+zgib64tFghi0/ytweOaRkpK+P+1m8IFt9h7eaGZoy1qVnvCn1L602n5VPUol6SKe2LGkXgVRkbIMZpEcxQ10aV/Imls/siMAvtes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1Z1rHbR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1Z1rHbR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765770717; x=1797306717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tv+6WHQtcQWkl905f+3Iu7W12IYA8HG6+Bx0cStnWM0=;
  b=O1Z1rHbRlj4zvAX2XtdlAC/KWe5M4Zju0MuhaHdjgQGWHf6E5ioChNNm
   nRJ+/hgzKpui3P9Wb9FcCUfS/MXnERrqJ5LJdCIKoVy98e4x5oGadvws6
   94Cxrd1Dllwjr2Ttqm2r9ZkZZXWB7QwLX0LXR3ksJkIRdK41vaSTldeK3
   XlZ+Pd04rqqRyxTsH03Ebwphapo5Bldsoh8rdCqHg+MhY6BFlmnXyNI4U
   o2dqV9PgmpyBHGktlb6x+ZkwUnk5MctXhQNx1NKoajWhxlW/6/W/eYo9X
   JlnNHmZOibu1HzRbJal0QOjEYZHpJ117cf3DdxaWVjNupm5KnM0mEmC5d
   w==;
X-CSE-ConnectionGUID: jyHMJVQSTo+45vwDoNQMcA==
X-CSE-MsgGUID: qVPTfslqTpe3MCMCpl/kKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67546368"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67546368"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 19:51:56 -0800
X-CSE-ConnectionGUID: lYLPdDnXST+jKbZOghK46Q==
X-CSE-MsgGUID: 3KULLt40RoW4AAvitoKi5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197382913"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 14 Dec 2025 19:51:53 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUzck-000000002Ye-2ivA;
	Mon, 15 Dec 2025 03:51:50 +0000
Date: Mon, 15 Dec 2025 04:51:39 +0100
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v21 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Message-ID: <202512150427.Kc14BEvI-lkp@intel.com>
References: <20251212-imx-se-if-v21-1-ee7d6052d848@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-imx-se-if-v21-1-ee7d6052d848@nxp.com>

Hi Pankaj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4a26e7032d7d57c998598c08a034872d6f0d3945]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20251212-172535
base:   4a26e7032d7d57c998598c08a034872d6f0d3945
patch link:    https://lore.kernel.org/r/20251212-imx-se-if-v21-1-ee7d6052d848%40nxp.com
patch subject: [PATCH v21 1/7] Documentation/firmware: add imx/se to other_interfaces
reproduce: (https://download.01.org/0day-ci/archive/20251215/202512150427.Kc14BEvI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150427.Kc14BEvI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/firmware/intel/stratix10-svc-client.h
   WARNING: No kernel-doc for file ./include/linux/firmware/intel/stratix10-svc-client.h
   Documentation/driver-api/firmware/other_interfaces.rst:60: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/firmware/other_interfaces.rst:103: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/firmware/other_interfaces.rst:115: ERROR: Unexpected indentation. [docutils]
>> Documentation/driver-api/firmware/other_interfaces.rst:116: WARNING: Blank line required after table. [docutils]
>> Documentation/driver-api/firmware/other_interfaces.rst:140: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./drivers/firmware/imx/se_fw.c
   ERROR: Cannot find file ./drivers/firmware/imx/se_fw.c
   WARNING: No kernel-doc for file ./drivers/firmware/imx/se_fw.c
   ERROR: Cannot find file ./include/linux/fpga/fpga-bridge.h
   WARNING: No kernel-doc for file ./include/linux/fpga/fpga-bridge.h


vim +116 Documentation/driver-api/firmware/other_interfaces.rst

    94	
    95	::
    96	   +--------------------------------------------+
    97	   |            Character Device(C_DEV)         |
    98	   |                                            |
    99	   |   +---------+ +---------+     +---------+  |
   100	   |   | misc #1 | | misc #2 | ... | misc #n |  |
   101	   |   |  dev    | |  dev    |     | dev     |  |
   102	   |   +---------+ +---------+     +---------+  |
   103	   |        +-------------------------+         |
   104	   |        | Misc. Dev Synchr. Logic |         |
   105	   |        +-------------------------+         |
   106	   |                                            |
   107	   +--------------------------------------------+
   108	
   109	   +--------------------------------------------+
   110	   |               Service Layer                |
   111	   |                                            |
   112	   |      +-----------------------------+       |
   113	   |      | Message Serialization Logic |       |
   114	   |      +-----------------------------+       |
   115	   |          +---------------+                 |
 > 116	   |          |  imx-mailbox  |                 |
   117	   |          |   mailbox.c   |                 |
   118	   |          +---------------+                 |
   119	   |                                            |
   120	   +--------------------------------------------+
   121	
   122	- service layer:
   123	  This layer is responsible for ensuring the communication protocol that is defined
   124	  for communication with firmware.
   125	
   126	  FW Communication protocol ensures two things:
   127	  - Serializing the messages to be sent over an MU.
   128	
   129	  - FW can handle one command message at a time.
   130	
   131	- c_dev:
   132	  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
   133	  Using these multiple device contexts that are getting multiplexed over a single MU,
   134	  userspace application(s) can call fops like write/read to send the command message,
   135	  and read back the command response message to/from Firmware.
   136	  fops like read & write use the above defined service layer API(s) to communicate with
   137	  Firmware.
   138	
   139	  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
 > 140	::
   141	
   142	                                Non-Secure               +   Secure
   143	                                                         |
   144	                                                         |
   145	                  +---------+      +-------------+       |
   146	                  | se_fw.c +<---->+imx-mailbox.c|       |
   147	                  |         |      |  mailbox.c  +<-->+------+    +------+
   148	                  +---+-----+      +-------------+    | MU X +<-->+ ELE |
   149	                      |                               +------+    +------+
   150	                      +----------------+                 |
   151	                      |                |                 |
   152	                      v                v                 |
   153	                  logical           logical              |
   154	                  receiver          waiter               |
   155	                     +                 +                 |
   156	                     |                 |                 |
   157	                     |                 |                 |
   158	                     |            +----+------+          |
   159	                     |            |           |          |
   160	                     |            |           |          |
   161	              device_ctx     device_ctx     device_ctx   |
   162	                                                         |
   163	                User 0        User 1       User Y        |
   164	                +------+      +------+     +------+      |
   165	                |misc.c|      |misc.c|     |misc.c|      |
   166	 kernel space   +------+      +------+     +------+      |
   167	                                                         |
   168	 +------------------------------------------------------ |
   169	                    |             |           |          |
   170	 userspace     /dev/ele_muXch0    |           |          |
   171	                          /dev/ele_muXch1     |          |
   172	                                        /dev/ele_muXchY  |
   173	                                                         |
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
