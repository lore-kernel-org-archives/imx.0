Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A61B1850BF;
	Fri, 14 Jun 2024 22:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718403945; cv=none; b=toWtc3Q0yfehbbAhBnrwHjCF32jWe5Yl3TnAf8FDSfcH48V4UqMeCJAoMX8BIYPjCTOqh2V8s0M+EE6LIkJldJkVztHXDOXnVARuAsfMyY5rpua44XaBOMRHveyLn7FQb3iMNg5/MSO/jDJAqz7HBaCgYnymoHl/DAD8zO0u3aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718403945; c=relaxed/simple;
	bh=6YgvbtWNyXFx8I2W9QnTK3WvMLjx61KuOPEvg44eqqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZpwYnaHTrRPdicr/sXZ5vi52+qqqdiGz2LMWhEBsrUBuNNXCwAq0rAHQMGm8mOkc/G2iv6BR5dJ07pUCeUPOaTBY+b1OxAXo9jYEGR4PIqPfN7LT/+Lzfs0VLWNLyOQq/e9VYycl9aQ6gFa7wGfLzAL0cs54dbC1aONRZAjVvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8bdn6kZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8bdn6kZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718403941; x=1749939941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6YgvbtWNyXFx8I2W9QnTK3WvMLjx61KuOPEvg44eqqE=;
  b=X8bdn6kZXvQLclfeXs+jcH6IHH1U278A0jTahTYBHDgCp9Fns2g9nTk2
   HRA0V4i3JWbgg+l+VKhkQHQIl9+zmIbThOrIujhzuMc1R3ZjyluCkdC5X
   9vTxh7yr6rQ3bXC58YRyPWCnTOHTCvCcjHnTTWi4MSm9wtRDANZKRrr7C
   oNWW+zZ9Avg6a27uLiArY7U6QZH/VErLhREyYJ2uTQC9Ys6Hsxa251not
   dwaZV5TqWjogqsS6jEYHCUr1LS6LPe+qCzn5L8SxHhkjNXLf9437gmJR+
   2ACu+Zybyj7Ow2oLWHceZFiS6qFQ6LHtqESrQcU5U37bhsWLFlmP1Hp0H
   A==;
X-CSE-ConnectionGUID: EZdIKrLrSnaD7UBW36Taww==
X-CSE-MsgGUID: 5X1WiV8LSx+kh4mDfFUuEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="37835241"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="37835241"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 15:25:38 -0700
X-CSE-ConnectionGUID: ReAJNsFFT2SLqVFuiMtE7w==
X-CSE-MsgGUID: 9mAHqE0uQmKhxmwPtsJ7nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="41340753"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jun 2024 15:25:26 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIFMJ-0001rZ-0p;
	Fri, 14 Jun 2024 22:25:23 +0000
Date: Sat, 15 Jun 2024 06:24:49 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Sean Anderson <sean.anderson@seco.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 2/2] dt-bindings: net: Convert fsl-fman to yaml
Message-ID: <202406150653.31VnJ0A4-lkp@intel.com>
References: <20240614-ls_fman-v1-2-cb33c96dc799@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614-ls_fman-v1-2-cb33c96dc799@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 03d44168cbd7fc57d5de56a3730427db758fc7f6]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-ptp-Convert-ptp-qoirq-to-yaml-format/20240615-043704
base:   03d44168cbd7fc57d5de56a3730427db758fc7f6
patch link:    https://lore.kernel.org/r/20240614-ls_fman-v1-2-cb33c96dc799%40nxp.com
patch subject: [PATCH 2/2] dt-bindings: net: Convert fsl-fman to yaml
reproduce: (https://download.01.org/0day-ci/archive/20240615/202406150653.31VnJ0A4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150653.31VnJ0A4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/net/fsl-fman.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
